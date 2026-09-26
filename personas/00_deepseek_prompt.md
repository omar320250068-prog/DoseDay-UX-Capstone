# DeepSeek extraction prompt (paste into chat.deepseek.com)

> **Status: run in Claude, not DeepSeek.** This prompt is kept as the protocol
> record, not as a claim about what happened. DeepSeek sign-up was blocked by a
> repeating hCaptcha and an OpenAI API fallback returned HTTP 429 on every model
> tried, so the extraction was run in an authenticated Claude Free session on
> 2026-09-26. The full provenance, including every model attempted and how it
> failed, is in section 0 of `03_verification_log.md`. The prompt below is
> unchanged from what was actually sent, apart from this note.
>
> **When re-running this, paste `interviews/ALL_TRANSCRIPTS.md` and nothing
> else.** That file is transcripts-only by design. Do not paste
> `00_README_DATA_PROVENANCE.md`: its trap table lists the seven intended
> failures *and their correct answers*, which would make the 7-of-7 trap result
> meaningless. This was defect C-11, where the bundle itself had drifted.

## Message 1 — setup + corpus

```
You are a UX research assistant. I am giving you five anonymized interview
transcripts from a medication-management app called DoseDay. Participants are
coded P1-P5. "INT" is the interviewer, everything else is verbatim participant
speech. Do not invent information that is not in these transcripts. If something
is ambiguous or the participants contradict each other, say so explicitly and
flag it as AMBIGUOUS rather than resolving it silently.

Here are the transcripts:

<paste ALL_TRANSCRIPTS.md content here>
```

## Message 2 — the extraction task

```
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
```

## Message 3 — challenge round (send after reading the draft)

```
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
```

## Output handling

1. Copy DeepSeek's raw answer(s) verbatim into
   `personas/01_deepseek_raw_draft.md` (do not tidy the markdown).
2. Copy the hostile-review answer verbatim into
   `personas/02_deepseek_self_critique.md`.
3. Only then start manual verification into `personas/03_verification_log.md`.
