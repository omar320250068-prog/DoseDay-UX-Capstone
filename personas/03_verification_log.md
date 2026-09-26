# Verification log — DoseDay persona pack

**What this is:** every claim in the AI's first draft, checked line by line against the
raw transcripts in `interviews/`. It records what was rejected, what was corrected, what
was kept with a caveat, and what the AI got right for the wrong reason.

**Who did the verification:** Omar Hindawy (human), against the transcripts, without
asking the model to check its own work first.

---

## 0. Tool provenance — read this before the table

| Item | Detail |
| --- | --- |
| Model asked for by the brief | DeepSeek (chat.deepseek.com) |
| What happened | Sign-up blocked by a repeating hCaptcha image challenge, 3 failed attempts, 2026-09-26. No DeepSeek API key on the machine. |
| Second attempt | OpenAI API via the key in `$env:OPENAI_API_KEY`. Every `POST` to `api.openai.com` returned HTTP 429 with an empty body (`GET /v1/models` succeeded, so the key is valid — the sandbox blocks the write path). Models tried: `gpt-5.4-pro`, `gpt-5.2-pro`, `gpt-5`, `gpt-5-mini`, `gpt-4.1-mini`, `gpt-4o-mini`, `gpt-5.4-nano`. All 429. |
| Model actually used | **Claude** (claude.ai, authenticated Free-plan session, extended thinking on) |
| Conversation | https://claude.ai/chat/362ca1cc-8b9d-46db-b55f-1fbbfa85afcd |
| Raw outputs saved | `02_ai_raw_draft.md` (turn 2, verbatim), `03_ai_self_critique.md` (turn 3, verbatim) |
| Third turn | We asked the model to attack its own draft as a hostile reviewer. Its findings are logged as pass 2 in §2.6 — and, importantly, they are logged as *its* findings, not as ours, because we asked. Every one was then re-checked by hand like any other claim. |
| Corpus sent | The five transcripts, verbatim dialogue and screener answers, **analyst notes removed** so the model could not read my own conclusions. Identical wording to the files in `interviews/`; only the `Data status` and `Analyst notes` blocks were stripped. Each interview is headed "Interview 01 — Participant P1", so the misleading filenames were not sent either. |
| Trap table sent | **No.** The seven planted traps in `interviews/00_README_DATA_PROVENANCE.md` were not shown to the model. |
| How that was confirmed | Not asserted — checked. A text search of the saved conversation at the URL above returns **0 hits** for `Deliberate traps`, `T4`, `macular`, `provenance`, `SIMULATED` and `Analyst note`, while the participant speech itself is present (`the sugar one` ×2, `I'm not going to call it by its name` ×3). The one hit for `macular` is inside the model's own output, where it names the condition in order to reject it — which is the V-15 / V-27 behaviour, not a leak. The check found a real defect in our own bundle; see C-11. |

This substitution is recorded because a portfolio piece that quietly swaps the named tool
is a portfolio piece nobody can trust. The pipeline, the prompt and the verification are
unaffected; only the model name changes.

---

## 1. Summary

| Metric | Count |
| --- | --- |
| **Pass 1** — claims checked against transcripts | 38 |
| **Rejected** (unsupported, deleted) | 6 |
| **Corrected** (true but wrong as written) | 7 |
| **Annotated** (kept, caveat added) | 6 |
| **Confirmed** (no change) | 19 |
| **Pass 2** — claims re-opened by the model's own hostile review (§2.6) | 4 |
| **Pass 3** — defects found in *our* pack, not the model's (§3, C-05 – C-11) | 7 |
| Planted traps caught by the model, unprompted | 7 of 7 |
| Real errors the model did **not** catch | 8 of 13 (see §4) |
| Defects found in my own corpus and fixed | 4 |

The trap result is the uncomfortable part. I planted seven specific failures in the
transcripts — wrong medication counts, a self-corrected age, a hedge that wanted to become
a metric, a missing clinical label, two unrelated medical events, a rejected diagnosis.
The model caught **all seven**, including two it had no instruction about. The errors it
actually made were somewhere I was not looking: invented setting details, a false claim
about the participants, and emotional labels that contradict what the participant said.

**The lesson worth carrying into the capstone:** adversarial traps test whether a model can
follow rules. They do not test whether it can read. Verification effort is better spent on
the second thing.

---

## 2. Edits to the AI draft

Verdicts: **REJECT** = deleted, no evidence. **CORRECT** = evidence exists but the draft
overstated it. **ANNOTATE** = kept, caveat recorded. **CONFIRM** = checked, no change.

### 2.1 Archetype A — "The Disrupted-Schedule Worker" (P1 + P4)

| # | AI draft says | Transcript evidence | Verdict | Action |
| --- | --- | --- | --- | --- |
| V-01 | "representing anyone whose paid work has no fixed daily shape — a rotating **hospital-adjacent** shift worker or a gig/rideshare driver" | P1 works in a distribution centre: "I have to be in at 6:15 for the early shift", "I'm on the floor a lot". Nothing hospital-related anywhere in P1's interview. P4 is a driver, but he never describes medical or hospital work. | **REJECT** | "hospital-adjacent" deleted. Archetype context is now "rotating shift work at an employer the corpus deliberately leaves unnamed (P1), or self-employed driving (P4)". A fabricated industry is the kind of detail that survives into a pitch deck for a year. Note: my first fix for this row said "rotating warehouse shift work", which is the same error — "warehouse" is P2's word, not P1's. Corrected as C-10. |
| V-02 | "Dax takes blood pressure medication that caused a genuinely frightening dizzy spell early on, **experienced completely alone**" | The fright is P4's alone-in-a-car-park episode. P1's experience was two weeks of dizziness during a night-shift rotation, and her fear was different in kind: "I thought I'd made a mistake, I'd been given the wrong thing." [P1] | **CORRECT** | Bio split. Composite now reads: P4 had the frightening-alone episode; P1 nearly stopped her medication because she thought she had been given the wrong one. Two different fears, not one. |
| V-03 | Goal: "Take doses without needing to remember a fixed clock time [P1: 'Three of them are morning']" | The quote is P1 describing her existing routine, not a difficulty. The real evidence is the rotation: "I'm on a rotation. Early, middle, late". P4's anchor is a cue, not a clock: "the tablet goes in the cup holder with the coffee". | **CORRECT** | Re-cited to the rotation and the coffee anchor. The draft's citation was technically real and completely irrelevant, which is worse than a fake quote. |
| V-04 | "P1: 3 daily morning medications (blood pressure, **diabetes-related**) plus **2 as-needed medications for back pain**" | P1 names conditions once, on the screener, and never links a medication to a condition. The two as-needed items are described differently: "one for when my back is bad, and one that's a strong one for the pain, but I'm not supposed to take that one every day." The second one's purpose is not established. | **CORRECT** | Now: "3 scheduled each morning, plus 2 as-needed of which she clearly identifies one as a back-pain medication; the second she describes only as 'a strong one for the pain' she is not supposed to take daily." Medication-to-condition mapping removed throughout. |
| V-05 | "P4 does not describe personally trying a dedicated medication app" | Correct, and worth keeping loudly. P4 has never used one. | **CONFIRM** | Kept, and promoted to a persona-level caveat: this archetype has **zero** product experience, so every design claim about it is untested preference, not observed behaviour. |
| V-06 | "Fictional name / age / context: 'Dax,' composite of two ages (59 and 45)" | P1's screener said 58 and corrected to 59 in the interview. Using 59 is right, and the correction is documented. | **CONFIRM** | Kept, with a footnote that the screener said 58 so the two sources are traceable. |

### 2.2 Archetype B — "The Tech-Fluent Minimalist" (P2 + P5)

| # | AI draft says | Transcript evidence | Verdict | Action |
| --- | --- | --- | --- | --- |
| V-07 | Table row citing `[P2: "I have 200 accounts"] [P5: "I have 200 accounts"]` as if identical | P2 said it in words: "I have two hundred accounts." P5 used numerals: "I have 200 accounts." | **ANNOTATE** | Both quotes corrected to the participant's actual wording. The substantive point (a striking coincidence between two participants) survives; the false identity of the quotations does not. |
| V-08 | "P2: three separate medication apps over four years, **all deleted** for diary/tracking behavior" | P2 describes two deletions in detail ("I deleted it last year. And I had one before that, and I deleted that too") and a third attempt he no longer has, without narrating its removal. He gives the diary reason once, as his general objection. | **CORRECT** | Now: "three attempts in four years; two deletions described in his own words, a third he no longer uses without narrating its removal. The stated reason throughout is that the app behaved like a diary." |
| V-09 | "P2: ... never missed by **his own account**" | P2 says "I never miss the morning one" twice, then immediately: "I would not say I never miss a dose. I'd say the morning one is bulletproof and the evening one is a coin toss when I'm late." | **ANNOTATE** | Kept, with his own qualifier attached. Also a pronoun problem — see V-14. |
| V-10 | Merged P2 and P5 into one archetype | The two contradict each other on the central question: P2 "I don't want a report" vs P5 "I want a log - dated rows, exportable, mine". The model flagged this itself. | **CONFIRM** | Merge **rejected** in the final pack. Archetype B is now P2 alone ("The Unbothered"), and P5 becomes a separate sidebar persona ("The Audit Trail") because the contradiction is a segmentation question, not a footnote. The model's own merge is preserved in the log so the disagreement is visible. |
| V-11 | P3 stage direction: "She crosses a name off the whiteboard and drops a sheet of paper into a bin bag." flagged AMBIGUOUS — possible third party, self-slip, or transcription artifact | This one is mine. In the transcript file that line was an observer stage direction in the third person, dropped in the middle of P3's first-person account of the same actions, and it invited exactly the reading the model gave. | **RESOLVED BY INTERVIEWER — corpus defect** | The source file is fixed (see §3). The model's instinct was right and its three candidate explanations were all wrong: there is no third party. Good catch by the model, wrong conclusion, correctly hedged. |

### 2.3 Archetype C — "The Physical-Ritual Elder" (P3)

| # | AI draft says | Transcript evidence | Verdict | Action |
| --- | --- | --- | --- | --- |
| V-12 | "Rosa, 67, lives alone, manages five medications for five different conditions" | P3 names five conditions on the screener and never names a single medication. Five medications ↔ five conditions is an assumption, not an observation. | **CORRECT** | Now: "manages five medications. Her screener lists five conditions, but she names no medication and does not link any pill to any condition." |
| V-13 | "P3, who also takes a thyroid medication" (in the contradictions section) | Same inference, different direction: the model treats P3's screener condition list as a medication list. | **CORRECT** | The thyroid contradiction is reframed honestly: two participants both *report* a thyroid condition, neither names a thyroid medication, so the timing contradiction cannot be established from this corpus at all. It is now logged as a research question, not a finding. |
| V-14 | "Daily check-ins from her daughter feel like **surveillance, not care**" | P3 explicitly refuses that framing: "is she wrong to ask? No. I'd ask." Her objection is to the *tone* and to the daily granularity, not to being checked on: "I'd rather have a thing that says 'you haven't ticked today' and no tone at all." | **CORRECT** | Now: "being checked on is welcome; being checked on *with an emotional tone, daily, by someone who doesn't have to do it* is not." The distinction is her point, not the model's. |
| V-15 | "She has vision trouble she declines to name [P3: 'I'm not going to call it by its name']" | Exactly right. The model refused "macular degeneration" and explained why. | **CONFIRM** | Kept verbatim, including the refusal. Note the trap: this is the single most likely place for a persona pack to invent a diagnosis. |
| V-16 | "Technology is a last resort used only where the physical system cannot do the job" | Supported by the bin/whiteboard/rubber-band system, and by "if it can't do it for me, at least it should not nag me. It should be dull." | **CONFIRM** | Kept. "Dull and correct" promoted to the persona's design principle, in her words. |

### 2.4 Emotional journey map

| # | AI draft says | Transcript evidence | Verdict | Action |
| --- | --- | --- | --- | --- |
| V-17 | Midday (−3): "**Anxious** improvisation... food-dependent doses collide with unpredictable access to food" | P4 rules out the emotional reading in his own words: "Honestly? It's mostly a nuisance, and I'm not dramatic about it", and "It's not fear." | **CORRECT** | Emotion changed to "irritated improvisation" and the participant's own framing is quoted directly beneath it. This is the worst error in the draft: an emotion attributed to a participant who explicitly disclaimed it. |
| V-18 | Midday (−3) framed as a general stage | The Midday row is built almost entirely on P4. No other participant describes a midday dose problem. P2's midday is unremarkable; P1 and P3 take everything morning and evening. | **ANNOTATE** | Row relabelled "Midday (P4 only — single source)". A journey map stage resting on one person is a hypothesis, and the board now says so on the map itself. |
| V-19 | Late shifts / disrupted days (−4): "shame (P1), fear (P3), and broken travel routines (P5) converge" | P3 has no shifts and no travel. Her fear came from a missed dose and two weeks of not knowing the scale of a miss — nothing to do with a rota. P5's travel failure is real ("The box does not travel") but has nothing to do with shifts. | **CORRECT** | Stage split into what it actually contains: (a) rota disruption → P1, P4; (b) routine that does not travel → P5; (c) unquantified fear of a single miss → P3. Three mechanisms, three sources, one −4 that was hiding all three. |
| V-20 | "the moment **existing apps** actively made things worse" at that stage | Only P1 (deleted after the red circle) and P3 (lost four names) had an app make things worse. P5's failure was her own box and a phone reminder; she has never run a medication app to a bad outcome. | **CORRECT** | Reworded: "the moment the *system* punishes, whether that system is an app or a pillbox". |
| V-21 | "Three highest points: Next morning (+1), Deciding to start (0), **Waking (−2)**" | Internally consistent as a ranking, misleading as a headline. A PM reading "three highest points" on a mood chart will assume positive states. | **ANNOTATE** | Section retitled "Three least-bad points" with the absolute values shown next to the names, and an explicit note that no stage in this map is emotionally positive except the last. |
| V-22 | Evening dose (−3) "Quiet self-doubt / rationalized skipping" [P2] | Strongly supported: "do I really need this tonight? And honestly, the answer's sometimes no." | **CONFIRM** | Kept, and now carries P2's own phrase "a coin toss when I'm late" as the stage emotion. |
| V-23 | "Deciding to start (0)... participants with simple, habit-anchored regimens (P2, P5) report ease" | Supported: P2 "Tablet with the first coffee"; P5 "the pill goes in and the coffee follows". | **CONFIRM** | Kept. The map's most useful finding survives intact: the same product moment is +4 for one persona and −2 for another, and the variable is the number of medications, not the user's diligence. |

### 2.5 "Claims I could not support" and "Assumptions and gaps"

| # | AI draft says | Transcript evidence | Verdict | Action |
| --- | --- | --- | --- | --- |
| V-24 | "**No participant states their own gender.** References to 'my wife' (P1) or 'my sister' (P4) describe relationships, not the participant's own gender identity" | False for two of five. P3: "And I'm a grown woman, and every day." P4: "I'm a grown man with a blood pressure problem and I'm taking internet opinions from strangers." | **REJECT** | Claim deleted. P3 and P4 state their own gender. P1, P2 and P5 do not, so those personas stay gender-neutral. |
| V-25 | The same draft then writes "never missed by **his** own account" (P2) and "P3's daughter checks on **her**" | The model held P1/P2/P5 as unstated while using a gendered pronoun for P2 two sections after declaring all genders unstated. | **CORRECT** | P2's persona is now written gender-neutral throughout, and the inconsistency is logged here rather than quietly fixed. A model that announces a rule and then breaks it is a warning about the rest of its output. |
| V-26 | Rejected: "P5 has anxiety and depression" | P5: "Sertraline is for anxiety, not depression. I don't have a depression diagnosis, I've never had one, and if a product writes 'depression' about me it is both wrong and dangerous." | **CONFIRM** | Trap caught, with the participant's own reasoning quoted. Kept as a worked example of the failure mode. |
| V-27 | Rejected: "P3 has macular degeneration" / any named eye condition | P3 declines to name it. | **CONFIRM** | Trap caught. |
| V-28 | Rejected: any adherence percentage for P1 or P2; any annualised dose count for P5 | All three figures are hedged in the source. | **CONFIRM** | Trap caught, three times. The log's own summary table therefore carries **no adherence statistic**, only the hedges, quoted. |
| V-29 | Rejected: "P4's urgent care visit and his kidney stone are related events" | P4 asks for them to be kept apart: "I want it to be careful here, because the two things got tangled... It was the stone, and it was in my side, and it was a different afternoon entirely." | **CONFIRM** | Trap caught. Also confirmed: no hospital admission is claimed anywhere. P4 sat down in a car park, felt frightened, and went to urgent care. |
| V-30 | Rejected: "P1's daughter is overbearing / controlling" | P1 reports a fear of that framing, not a fact about her daughter. | **CONFIRM** | Kept as a boundary on the persona: the daughter is characterised by P1's anxiety, and the pack must not inherit it. |
| V-31 | Rejected: "P2 is prediabetic" | P2's own words: "borderline on the sugar thing". | **CONFIRM** | Kept verbatim, unconverted. |
| V-32 | "P3, who also takes a thyroid medication" contradicting P5's exact-time requirement | See V-13. | **CORRECT** | Logged as an unresearchable contradiction with this corpus. |
| V-33 | "Condition and age fields... are not always presented as direct quotes in the screener block" | The model caught a defect in **my** corpus: P1's and P3's condition lines were paraphrased by me while every other screener field was quoted. | **CORRECT — corpus defect** | Both fields are now verbatim quotes (§3). The model was right and I was wrong. |

### 2.6 Pass 2 — the model's hostile review of its own draft

We asked the model to review its turn-2 output as an adversary. It returned fifteen
findings against three archetypes. Four of them survive a hand-check and are logged
here. The value of this pass is real but bounded: **we asked, so none of it counts as
the model catching itself.** It is logged separately from §1 for that reason.

| # | AI draft says | Transcript evidence | Verdict | Action |
| --- | --- | --- | --- | --- |
| V-34 | `[P3: "I press the air... The app never did it. My finger did it."]` presented as one quote | "I press the air" is P3's answer on button size (`03_P3` line 54). "The app never did it. My finger did it." is a later answer, after INT asks "Four names?" (line 58). Two separate turns, spliced into one continuous quote. | **REJECT** | The splice is not used. The board carries only the second half, which is contiguous and verbatim in the source. This is the most serious class of error in the whole exercise: no word is invented, but a continuity is. |
| V-35 | `[P3: "if I knew one of them was the dangerous one, I would... put a different mark on that one"]` | Transcript: "I would **— yes, I would** put a different mark on that one." An ellipsis was substituted for real words inside quotation marks. | **REJECT** | Quote dropped. The underlying need — separate the one that matters from the group — is carried as a design consequence in P3's own framing, not as a doctored quote. |
| V-36 | Archetype label "The Physical-Ritual Elder" | Not a factual error but a tone failure: "I'm a grown woman, and every day", and she objects to being spoken to "like a child" and to her daughter seeing a record "and I'm a child". | **REJECT (label)** | Renamed **The Unanchored**. No age-derived label appears anywhere in the pack. A persona name that reproduces the framing a participant pushed back on is a defect even when the facts are right. |
| V-37 | Composite persona described as running their life through "banking, training, football, calendar" and as reading privacy policies before trusting an app | Both are single-participant traits: the app list is P2's alone (`02_P2` line 22), the policy-reading is P5's alone (`05_P5` line 22). The draft presented each as a property of the merged persona. | **REJECT** | Resolved structurally rather than cosmetically: the V-10 split means neither trait is ever attributed to the wrong person again. |

The remaining eleven findings were checked and are either already handled (P2's
"twice a week? Maybe" correctly left hedged; P5's use of the word "depression" inside
her own quotation, which is her rejection of the label rather than an application of
it) or are matters of taste we declined to change. A hostile review that produces
eleven non-findings is still worth reading, but it is not a second dataset.

---

## 3. Defects found in my own corpus, and in my own output

Verification is not only a filter on the model. C-01 – C-04 are defects in the
**corpus** I built. C-05 – C-11 are defects in the **pack I wrote after verifying the
model** — seven unsourced or self-contradicting claims that survived a verification
pass, because I was checking the model's sentences and not my own.

| ID | Defect | Fix applied |
| --- | --- | --- |
| C-05 | **Four job titles and industries in the persona cards came from my own filenames.** `01_P1_shift_supervisor.md`, `03_P3_retired_teacher.md` and `05_P5_phd_student.md` put three occupations into the file names, and the cards inherited them: "shift supervisor", "retired", "PhD student". None of the three appears in any transcript. A fourth, "distribution centre", I invented outright — the same unsourced-industry error as V-01. Each file's anonymization note says the employer, school and city were *removed on purpose*, so the personas were publishing exactly what the corpus was built to withhold. | All four removed. Subtitles now state only what the transcripts support: P1 "rotating shift work, employer unnamed"; P2 "warehouse team lead" (both words are P2's); P3 "lives alone"; P4 "takes fares and deliveries"; P5 carries no occupation. New rule added to the guide and to `interviews/00_README_DATA_PROVENANCE.md`: **a filename is not evidence.** |
| C-06 | P1 was written "she/her" under the invented name "Leila" — breaking the rule this log set in V-24 and V-25, which states that P1 does not declare a gender. The model had made the mirror-image error in the other direction, calling P1 "Dax" and "his". P5's sidebar had the same problem. | P1 and P5 are now written neutral (they/them); P1's fictional name is the neutral "Rowan". P3 ("I'm a grown woman") and P4 ("I'm a grown man") keep gendered pronouns because they state their own. A stated rule that survives only in the section where it is inconvenient is not a rule. |
| C-07 | A P1 quotation had been edited inside the quotation marks: "I have done everything right for two years and it says I'm a bad patient." Transcript: "I have done everything right **for that medication** for two years and **one screen tells me** I'm a bad patient." | Restored verbatim. This is V-35 repeated in our own output, one week and one board apart: the habit of tidying a quote for line length is the same habit that produces V-35. |
| C-08 | A P3 quotation was truncated with a full stop instead of an ellipsis: "I had been afraid of my own medicine for two weeks." The sentence continues "...because nobody told me the scale of a single miss" — which is the entire point of the quote. | Ellipsis added, so the reader can see that something was left out. |
| C-09 | The guide promises every persona card is split into `Grounded (n)` and `Assumption`, so a reader can see the ratio. The first board showed only the count, and no assumption was ever written down. | Every card now carries a named **ASSUMPTIONS TO TEST** block: two assumptions each, each naming a question and a method. The count on the chip is now a summary of something you can read. |
| C-10 | The remediation text of V-01 — the row written specifically to kill an invented industry — itself introduced "rotating **warehouse** shift work" for P1. "Warehouse" is P2's word. | Corrected to "rotating shift work at an employer the corpus deliberately leaves unnamed". A fix that repeats the error it is fixing is worse than no fix, because it looks like the row has been handled. |
| C-01 | `03_P3_retired_teacher.md`: a third-person stage direction ("She crosses a name off the whiteboard…") sat inside P3's first-person account of the same action. It implied a caregiver who does not exist. | Rewritten as an explicitly bracketed observer note covering the whole demonstration, plus a transcription-convention note at the foot of the file. |
| C-02 | `01_P1_shift_supervisor.md` and `03_P3_retired_teacher.md`: the `Condition` screener field was paraphrased while every other field was a verbatim quote. | Both are now quoted strings, as in P2/P4/P5. |
| C-03 | `05_P5_phd_student.md` analyst note: "Five apps tried, five removed." The transcript supports that she has removed health apps, but gives no count. | Note rewritten to state no number, matching the rule the pack applies to everyone else. |
| C-04 | `ALL_TRANSCRIPTS.md` was built before C-01 and C-02 were fixed, so the bundle no longer matched the sources. | Rebuilt from the corrected files. The model saw the pre-fix text, which is why V-11 and V-33 are logged as corpus defects rather than model errors. |
| C-11 | **The paste-ready bundle still contained the answer key.** §0 asserts the planted-trap table was withheld from the model, and the Claude conversation confirms it — a text search of the transcript returns zero hits for `Deliberate traps`, `T4`, `macular`, `provenance` and `SIMULATED`. But `ALL_TRANSCRIPTS.md`, described in the provenance README and in the extraction prompt as the "single paste-ready bundle", embedded the entire `00_README_DATA_PROVENANCE.md` **including the seven traps and their correct answers**. So the committed artifact would have leaked every trap to any future run, and the 7-of-7 result in §4 was one paste away from being unreproducible. The artifact and the claim about the artifact had drifted apart, which is C-05's species again: a specific, checkable thing that does not match the source. | Bundle rebuilt as transcripts only. Its new header states in full what is omitted and why — analyst notes, the trap table, the `SIMULATED` banner and the misleading file-routing table — and records that this is what was actually pasted on 26 Sep 2026. The model also never saw the unsourced filenames, since the bundle heads each interview as "Interview 01 — Participant P1". Verified by re-searching the rebuilt file: 0 hits for the trap table, 0 for `macular`, all five interviews intact. |

C-05 is the one worth remembering. Every trap in §4 was designed to catch the model, and
all seven were caught. None of them was aimed at me, and three of my seven own-output
defects are the same species as the ones I planted: a specific, plausible detail with no
source. Planting traps tests the model. Running a second pass over your own deliverable
is what tests you. C-11 is the sharpest version of the lesson, because it was caught by
checking a claim against the artifact it described rather than by reading the artifact
again.

---

## 4. Planted traps — result

| Trap | What was planted | Model's answer | Result |
| --- | --- | --- | --- |
| T1 | P1's 3 scheduled + 2 as-needed | "3 daily morning... plus 2 as-needed"; only the *purpose* of the as-needed pair was misread (V-04) | **Caught** |
| T2 | P1's age changes 58 → 59 mid-call | Flagged AMBIGUOUS in turn 1, then used 59 with a traceable footnote | **Caught** |
| T3 | P2 says "I never miss" then admits misses | Split into "morning bulletproof / evening a coin toss", hedge preserved (V-09) | **Caught** |
| T4 | P3 has no diabetes and declines to name her eye condition | Refused to name the condition; never added diabetes | **Caught** |
| T5 | P4's urgent-care visit vs his kidney stone | Refused the merge, quoted his request not to conflate them | **Caught** |
| T6 | P5 rejects a depression label | Refused, quoted her correction verbatim | **Caught** |
| T7 | Hedge-heavy adherence numbers | Refused all conversions to rates, percentages, annual counts | **Caught** |

The model was never shown the trap table, so these were not targeted. They are the
strongest evidence in this pack that a capable model with a strict extraction prompt and a
clean corpus produces a usable first draft.

---

## 5. What the model got wrong that nothing was watching for

1. **An invented industry** (V-01). "Hospital-adjacent" appears nowhere in 36,000 characters
   of interview. It is the most dangerous class of error in persona work because it is
   specific, plausible, and impossible to trace without reading the source.
2. **A false universal negative** (V-24). "No participant states their own gender" was
   wrong about two of five participants, both of whom say it plainly. A hedge is not
   automatically a truth.
3. **An emotion the participant disclaimed** (V-17). "Anxious improvisation", against
   "It's not fear." Models smooth people into a valence scale; people refuse to be smoothed.
4. **A participant's nuance replaced by a motive** (V-14). "Surveillance, not care"
   overwrote "is she wrong to ask? No. I'd ask."
5. **Two mechanisms fused into one emotional low** (V-19), which hid the fact that the
   three sub-cases have three different fixes.
6. **A rule announced and then broken** (V-25): gender treated as unstated, then used.
7. **A merged persona hiding a live contradiction** (V-10). The model flagged the
   contradiction and then shipped the merge anyway, with the contradiction in a footnote.
   Flagging is not resolving.
8. **Cited quotes that were real but irrelevant** (V-03). Harder to catch than a fake quote,
   because nothing looks wrong.

The list above is the model's work. It is not the complete list of unsourced claims that
appeared in this pack during drafting: six more were ours (C-05 – C-10), including one
invented industry, one invented gender, and a quote we tidied inside its own quotation
marks. The honest summary is that **verification is a two-sided filter and the side that
needs more work is the one you are looking at all day.**

---

## 6. What this changes about the workflow

| Practice | Reason, from this run |
| --- | --- |
| Keep a verbatim source corpus, not a summary | Two of the four corpus defects were invisible in summary form. |
| Quote screener fields or drop them | A paraphrased screener field is an unsourced claim wearing a source's clothes. |
| **Treat a filename as a label, never as evidence** | C-05: three occupations and one industry reached the persona cards through my own file names, and the anonymization notes said those details had been removed on purpose. |
| **Run a separate pass over your own deliverable** | C-05 – C-10: six unsourced claims in the pack I wrote, none of them caught by the pass I ran on the model. Change hats, change document, re-read. |
| Never let one persona hide an internal contradiction | V-10: the contradiction was correctly identified and then buried. |
| Check emotion words against the participant's own emotion words | V-17, V-14: both errors were in the emotion label, not the fact. |
| Check persona *names* against how the participant describes themselves | V-36: "Elder" was factually harmless and reproduced the exact framing P3 pushed back on. |
| Verify "nobody said X" claims too | V-24: absence claims are checkable and this one was false. |
| Apply a pronoun rule to your own cards, not only to the model's | C-06: the rule was written into the log and then broken two sections later, in the opposite direction from the model's error. |
| Budget human verification at roughly 20% of claims | 13 of 38 claims needed a change. None of the 13 were in the sections I expected. |
| Log what the model got right, with evidence | §4 is what makes the pack credible to a reviewer. A log of failures only looks like a list of complaints. |

---

## 7. Sign-off

- [x] Every persona claim traces to a participant code and a quote, or is marked ASSUMPTION.
- [x] No clinical or psychiatric label appears that a participant did not use or confirm.
- [x] No adherence statistic appears anywhere in the pack. Only quoted hedges.
- [x] No occupation, employer or industry appears in the pack that is not in a transcript (C-05).
- [x] Pronouns follow what each participant states about themselves, and nothing else (C-06).
- [x] Every quotation is byte-identical to the transcript, or carries an ellipsis (C-07, C-08).
- [x] The two-participant merge proposed by the model was rejected and the reasoning recorded (V-10).
- [x] The P3+P4 merge is ours, and is recorded as a decision rather than a blend.
- [x] Both raw model outputs are saved verbatim next to this log, including the hostile review.
- [x] Four defects in the source corpus are fixed and the bundle rebuilt.
- [x] Six defects in our own output are found, logged and fixed (C-05 – C-10).
- [ ] **Outstanding: this corpus is simulated.** `interviews/00_README_DATA_PROVENANCE.md`
      states that no human was interviewed. When real transcripts replace these files, this
      log is regenerated and the two logs are diffed. The traps in §4 are thrown away at that
      point, and the real model — the one that was actually interviewed — becomes the thing
      under test.

**Verification performed by:** Omar Hindawy, 2026-09-26, against
`interviews/01`–`05` and `interviews/ALL_TRANSCRIPTS.md`.
