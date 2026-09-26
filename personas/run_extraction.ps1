# run_extraction.ps1
# ---------------------------------------------------------------------------
# DoseDay persona extraction — AI draft generator
#
# STATUS: FAILED. Kept as a record of the attempt, not as a working path.
#   Run on 2026-09-26. Every POST to api.openai.com returned HTTP 429 with an
#   empty body, for every candidate model, and the script ended with
#   "No candidate model available." GET /v1/models succeeded, so the key was
#   valid — the sandbox blocked the write path. No draft was produced by this
#   script.
#
#   The extraction that actually ran was performed manually in an authenticated
#   Claude Free session, using the 3-message protocol preserved verbatim in
#   00_deepseek_prompt.md. The result is 02_ai_raw_draft.md.
#
# PROVENANCE / HONESTY NOTE
#   The assignment asked for DeepSeek (chat.deepseek.com). DeepSeek sign-up on
#   this machine was blocked by a repeating hCaptcha image challenge (3 failed
#   attempts, 2026-09-26), and no DeepSeek API key was available. OpenAI was
#   tried next as an automated fallback and also failed, as recorded above. The
#   third attempt, a Claude session, succeeded. The model used is named in
#   section 0 of 03_verification_log.md.
#
# Usage:  powershell -ExecutionPolicy Bypass -File run_extraction.ps1
# Key:    read from $env:OPENAI_API_KEY — never written to disk.
# ---------------------------------------------------------------------------

$ErrorActionPreference = 'Stop'
$root      = 'C:\trak num4'
$outDir    = Join-Path $root 'personas'
$corpus    = Get-Content (Join-Path $root 'interviews\ALL_TRANSCRIPTS.md') -Raw
$key       = $env:OPENAI_API_KEY
$stamp     = (Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ')
$candidates = @('gpt-5.4-pro', 'gpt-5.2-pro', 'gpt-5')

if (-not $key) { throw 'OPENAI_API_KEY is not set in this session.' }

function Write-Utf8NoBom {
    param([string]$Path, [string]$Text)
    [System.IO.File]::WriteAllText($Path, $Text, (New-Object System.Text.UTF8Encoding($false)))
}

function Invoke-Turn {
    param(
        [string]$Model,
        [object[]]$InputItems,
        [string]$PreviousResponseId = $null,
        [int]$MaxOutputTokens = 12000
    )
    $body = @{
        model              = $Model
        input              = $InputItems
        store              = $true
        max_output_tokens  = $MaxOutputTokens
    }
    if ($PreviousResponseId) { $body['previous_response_id'] = $PreviousResponseId }

    $json = $body | ConvertTo-Json -Depth 12 -Compress
    $resp = Invoke-RestMethod -Uri 'https://api.openai.com/v1/responses' `
        -Method Post -Headers @{ Authorization = "Bearer $key"; 'Content-Type' = 'application/json' } `
        -Body ([System.Text.Encoding]::UTF8.GetBytes($json)) -TimeoutSec 900

    $text = ''
    foreach ($item in $resp.output) {
        if ($item.type -eq 'message') {
            foreach ($part in $item.content) {
                if ($part.type -eq 'output_text') { $text += $part.text }
            }
        }
    }
    if (-not $text) { throw "No output_text in response $($resp.id) (status $($resp.status))." }
    return [pscustomobject]@{ Id = $resp.id; Text = $text; Usage = $resp.usage; Model = $resp.model }
}

# --- resolve a working model -------------------------------------------------
$model = $null
foreach ($c in $candidates) {
    try {
        $probe = Invoke-Turn -Model $c -InputItems @(
            @{ role = 'user'; content = @(@{ type = 'input_text'; text = 'reply with the single word: ok' }) }
        ) -MaxOutputTokens 2000
        $model = $probe.Model
        Write-Host "model resolved: $model"
        break
    } catch {
        Write-Host "model $c unavailable: $($_.Exception.Message)"
    }
}
if (-not $model) { throw 'No candidate model available.' }

# --- shared prompt scaffolding ---------------------------------------------
$systemPrompt = @'
You are a senior UX researcher extracting personas from raw interview transcripts.
Hard rules:
- Never invent a fact. Every claim must cite a participant code and a short verbatim
  quote snippet in square brackets, e.g. [P1: "one page, one big button"].
- If the transcripts are ambiguous, or two participants contradict each other, say so
  and label it AMBIGUOUS. Do not silently resolve it.
- Do not add a clinical or psychiatric label the participant did not use or confirm.
- Do not convert a hedge ("maybe", "I don't count", "hard to say") into a number.
- Do not merge two participants into one archetype unless you state the merge as an
  explicit design decision and show the shared evidence.
- Plain, concrete language. No marketing tone. No "seamless", "empower", "journey".
'@

$task2 = @'
From those five transcripts, produce the following. Ground every claim in a
specific quote and cite the participant code and a short quote snippet in
brackets, e.g. [P1: "one page, one big button"].

1. THREE DISTINCT USER ARCHETYPES. For each one give:
   - Archetype name (a short label, 2-3 words)
   - Fictional first name, age, and one-line life context
   - 120-word bio
   - Goals (3-5 bullets)
   - Pain points (4-6 bullets, each with the supporting quote)
   - The medication routine they are actually living
   - What they have already tried and abandoned, and why
   - Two direct quotes that best define them
   - Their relationship to technology in one sentence
   - Their most important unmet need, stated as a design opportunity

2. ONE EMOTIONAL JOURNEY MAP for the core task "taking today's doses on time",
   plotted across six stages: Waking -> Deciding to start -> Midday -> Evening
   dose -> Late shifts / disrupted days -> Next morning. For each stage give:
   - Emotional valence from -5 (distress) to +5 (relief)
   - The dominant emotion in one phrase
   - What is happening physically and contextually
   - A participant quote that supports the reading
   - Design implication for that moment
   Then list the three highest and three lowest points with an explanation of why.

3. A section called "CLAIMS I COULD NOT SUPPORT". List every claim you were
   tempted to make that the transcripts do not actually support, and say why you
   rejected it. Be strict: include claims about specific diagnoses, medication
   counts, adherence rates, family relationships, and demographic details.

4. A section called "ASSUMPTIONS AND GAPS": what a product team would still need
   to research, and which persona claims rest on a single participant's word.

Output in markdown with clear section headers. Use tables where they help.
'@

$task3 = @'
Now act as a hostile reviewer of your own draft. For each of the three
archetypes:
- List the 5 claims most likely to be a hallucination or an over-generalisation.
- For each, state exactly which transcript line supports it, or state that
  nothing supports it.
- Flag any place where you turned a hedge ("maybe", "I don't count", "hard to
  say") into a confident number or a confident trait.
- Flag any place where you merged two different participants into one archetype.
- Flag any place where you used a clinical label (for example "depression",
  "diabetic retinopathy", "non-compliance") that the participant did not use
  or did not confirm.
Do not rewrite the personas. Just produce the critique list.
'@

$log = @()
$log += "run started (UTC): $stamp"
$log += "protocol: 3-turn multi-turn conversation, store=true, previous_response_id chained"
$log += "assigned model requested: DeepSeek chat.deepseek.com -- BLOCKED by hCaptcha, substituted by user decision"
$log += "corpus: interviews\ALL_TRANSCRIPTS.md ($($corpus.Length) chars)"

# --- turn 1: corpus ---------------------------------------------------------
$t1 = Invoke-Turn -Model $model -InputItems @(
    @{ role = 'system'; content = @(@{ type = 'input_text'; text = $systemPrompt }) },
    @{ role = 'user';   content = @(@{ type = 'input_text'; text = "I am giving you five anonymized interview transcripts from a medication-management app called DoseDay. Participants are coded P1-P5. INT is the interviewer, everything else is verbatim participant speech. Confirm you have read all five and list the participant codes with their age and medication count exactly as stated in each file. If any count is ambiguous, say so.`n`n$corpus" }) }
)
Write-Utf8NoBom (Join-Path $outDir '01_ai_turn1_corpus_ack.md') $t1.Text
$log += "turn1 $($t1.Id) model=$($t1.Model) in=$($t1.Usage.input_tokens) out=$($t1.Usage.output_tokens)"

# --- turn 2: extraction -----------------------------------------------------
$t2 = Invoke-Turn -Model $model -PreviousResponseId $t1.Id -InputItems @(
    @{ role = 'user'; content = @(@{ type = 'input_text'; text = $task2 }) }
)
Write-Utf8NoBom (Join-Path $outDir '02_ai_raw_draft.md') $t2.Text
$log += "turn2 $($t2.Id) model=$($t2.Model) in=$($t2.Usage.input_tokens) out=$($t2.Usage.output_tokens)"

# --- turn 3: hostile self-review -------------------------------------------
$t3 = Invoke-Turn -Model $model -PreviousResponseId $t2.Id -InputItems @(
    @{ role = 'user'; content = @(@{ type = 'input_text'; text = $task3 }) }
)
Write-Utf8NoBom (Join-Path $outDir '03_ai_self_critique.md') $t3.Text
$log += "turn3 $($t3.Id) model=$($t3.Model) in=$($t3.Usage.input_tokens) out=$($t3.Usage.output_tokens)"
$log += "run finished (UTC): $((Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ssZ'))"

Write-Utf8NoBom (Join-Path $outDir '00_run_log.txt') ($log -join "`r`n")
Write-Host "done. files written to $outDir"
