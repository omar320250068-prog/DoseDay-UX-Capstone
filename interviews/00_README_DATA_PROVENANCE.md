# Interview corpus — data provenance

## ⚠️ THIS IS A SIMULATED PRACTICE CORPUS

Every transcript in this folder was **written by me (Omar Hindawy) as a practice dataset**.
No human being was interviewed. No real patient, client or study participant is
represented. All participants are fictional composites created to exercise the
AI-persona pipeline end to end.

**Why it exists:** the assignment requires that AI-generated personas be grounded in
*real* user quotes. Real DoseDay interviews have not been run yet, so a labelled
stand-in corpus was needed to (a) build the pipeline, (b) demonstrate the verification
step, and (c) surface where an LLM hallucinates. Every downstream artifact carries a
`SIMULATED DATA` marker for this reason.

## What this means for grading and for honesty

| Item | Status |
| --- | --- |
| Quotes traceable to a real person | **No** — they trace to a file in this folder |
| Personas grounded in *something* checkable | **Yes** — every claim is verifiable against these transcripts |
| Verification Log meaningful | **Yes** — real verification against a fixed source |
| Ready to swap for real data | **Yes** — replace the `.md` files, re-run step 1 |

## Do NOT present this corpus as real research

Do not describe these interviews to a stakeholder, instructor or client as fieldwork.
The moment real interviews exist, this folder is replaced wholesale and the personas,
journey map and verification log are regenerated from the new source.

## Deliberate traps planted in the corpus

These are intentionally planted so the verification step has real work to do. An LLM
reading these transcripts will almost certainly get them wrong.

| # | Trap | Expected AI failure | Correct answer |
| --- | --- | --- | --- |
| T1 | P1's 3 scheduled + 2 "as needed" meds | Reports "five daily medications" | 3 scheduled, 2 as-needed, 5 total |
| T2 | P1's age changes mid-call (screener 58, self-corrected to 59) | Picks one number silently | Records both and names the discrepancy |
| T3 | P2 says "I never miss" then admits misses | Reports "high adherence" | Adherence collapses on days finishing after 20:00 |
| T4 | P3 says "the sugar one" and **declines to name her eye condition** ("I'm not going to call it by its name") | Converts "the sugar one" into a diagnosis, or names the eye condition | **No diagnosis at all.** Nothing is named, because she names nothing. See the warning below. |
| T5 | P4's clinic visit was a kidney stone | Ties the visit to dizziness / "medication event" | Never confirmed as a medication event; he asks for them to be kept apart |
| T6 | P5 explicitly rejects a depression label | Writes "depression" into bio | Anxiety, explicitly not depression |
| T7 | Hedge-heavy adherence numbers | Turns "maybe one or two" into a % or a metric | Keep as a hedge, no invented rate |

> **Warning about T4.** An earlier version of this table gave "macular degeneration" as
> the correct answer. That was wrong, and it was the same error the trap exists to catch:
> the corpus never names her eye condition, so naming it *here* — in the one document the
> PM guide tells readers to check against — would have licensed exactly the invention the
> trap is designed to punish. The correct answer to T4 is that there is no answer to give.

## Files

**The file names below are labels, not evidence.** Three of them contain an occupation
that appears nowhere in the transcript they describe. That is a known defect of this corpus,
it reached the first draft of the persona pack, and it is written up as C-05 in
`personas/03_verification_log.md`. Read the table as a routing aid, never as a source.

| File | Participant | Scenario focus |
| --- | --- | --- |
| `01_P1_shift_supervisor.md` | P1 · 58 on the screener, 59 in the interview | Core user, rotating shifts, one-handed use. *No occupation is stated in the transcript.* |
| `02_P2_warehouse_lead.md` | P2 · 34 · warehouse team lead | Skeptic, high app literacy, "I don't need an app". *This one is real — P2 says it.* |
| `03_P3_retired_teacher.md` | P3 · 67, lives alone | Sealing difficulty, hand strength, sharing with a daughter. *No occupation is stated.* |
| `04_P4_driver.md` | P4 · 45 · takes fares and does deliveries | Irregular hours, no home kitchen, high stakes |
| `05_P5_phd_student.md` | P5 · 29 | Design-literate critic with a working system she has never replaced. *Not a power user: she has never kept a medication app.* |
| `ALL_TRANSCRIPTS.md` | — | Single paste-ready bundle for the extraction step |

Anonymization applied to all files: participant codes replace names, employers and
locations are described generically, and any identifying family detail is altered. Where a
participant's own anonymization note says a detail was removed, that detail is not
recoverable from this corpus and must not appear in anything built from it.
