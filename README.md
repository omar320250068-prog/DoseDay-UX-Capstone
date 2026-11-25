# DoseDay — UX/UI Capstone

Documentation and static exports for a UX/UI capstone about DoseDay, a mobile-first medication companion for adults managing multiple prescriptions. The repository holds research notes, a persona pack, information architecture and flow boards, and SVG wireframes; it does not contain an implementation of the app.

> [!IMPORTANT]
> The five interview transcripts in `interviews/` are a **simulated practice corpus** written for the AI-persona pipeline. No human was interviewed. `interviews/00_README_DATA_PROVENANCE.md` states this explicitly, and the persona boards carry a `SIMULATED DATA` marker. The desk research in `Capstone_Submission.txt` is a separate evidence base built from real published reviews and articles.

## Project brief

From `Capstone_Submission.txt`:

- **Primary user:** Rowan, 59, rotating shift work, five medications (three scheduled, two as-needed), employer unnamed and gender unstated. Earlier unsourced details in the draft were retracted.
- **Core problem:** people managing several prescriptions need one dependable daily routine, not another complicated health dashboard.
- **Proposed pilot measures:** 30 adults over four weeks; at least 80% of scheduled doses marked "Taken"; median first-time setup under three minutes. Guardrail: no dose decision overrides the prescription entered with the user or clinician.

## Desk research and design response

`Capstone_Submission.txt` records eight sources and 22 real user reviews (20 Apple App Store, 1 Google Play, 1 Reddit; 12 positive and 10 negative). It includes teardowns of Medisafe, MyTherapy, Hero: Medication Manager, and analog pill organizers/talking pill bottles, plus articles from WHO, CDC, PMC and Frontiers in Medical Technology.

The five findings recorded there are: the dose record matters as much as the reminder; scheduling arithmetic breaks on non-daily regimens; interface depth is an accessibility problem; reminder persistence means different things depending on how many people write to one record; and reliability defects become trust defects. The stated design response is a record-first screen, support for irregular and as-needed doses, reminder escalation that branches on the number of writers, no streaks/scores/red-for-missed state, and no blocking a medication from being added.

The submission also states what the evidence does not support: no current adherence rate, market size, willingness-to-pay conclusion, clinical outcome, or statistics from the simulated interview corpus.

## Persona pack

`personas/` contains the extraction prompt, the AI's raw draft, self-critique, a verification log, a six-minute PM guide, an extraction script, and four SVG boards: persona canvas, emotional journey map, verification log, and the how-to guide.

The pack has three personas — The Shifter (P1, "Rowan"), The Unbothered (P2, "Jay") and The Unanchored (a deliberate merge of P3 and P4, "Ada" and "Ray") — plus P5 as a design-literate critic rather than a fourth persona. Verification is documented in three passes: claims checked against transcripts, a hostile self-review, and defects found in the pack itself. Seven deliberate traps were planted in the simulated corpus so the extraction model's output could be checked.

`Capstone_Submission.txt` records two Figma files for the boards: [Personas](https://www.figma.com/design/uMEPML2LpHFl7xTVTOmBLB/DoseDay-%E2%80%94-Personas) and [Verification & PM Guide](https://www.figma.com/design/VlDQZmlqYgzQlmnEo7n4U1/DoseDay-%E2%80%94-Verification---PM-Guide).

## Information architecture and flows

`DoseDay_Page_1b_IA_flows.svg` is the exported IA board. It maps 25 screens in six groups: Start, Today, Medicines, Progress, Shared care and Settings. Navigation is three tabs plus utility; shared care is cross-cutting rather than a tab because most users would have an empty tab. Two primary users (the solo doser and the shared-record carer) have jobs to be done traced to the research findings.

Three flows are annotated with decision points, unhappy paths and named UX laws: logging a dose and knowing it is logged; onboarding and first run; and recovery from a reminder that never arrived. The board states that the grouping was **not** validated by a card sort or tree test.

## Wireframes and page exports

Five 390 × 844 SVG wireframes are at the repository root:

| File | Screen |
| --- | --- |
| `00_DoseDay_Today.svg` | Today — next dose, later doses, and Today/Meds/Week tabs. |
| `01_DoseDay_Add_Medication.svg` | Add medication — scan the package label or enter the name and dose manually. |
| `02_DoseDay_Medication_Details.svg` | Medication details — reminder, smart follow-up and a safety note. |
| `03_DoseDay_Weekly_Progress.svg` | Your week — doses taken, per-day history and a share-summary action. |
| `04_DoseDay_Dose_Confirmation.svg` | Dose taken — log confirmation, next dose and a timed undo option. |

The larger `DoseDay_Page_1.svg`, `DoseDay_Page_1b_IA_flows.svg`, `DoseDay_Page_2.svg` and `DoseDay_Page_3.svg` files are page-sized exports of the research/IA, UI and hand-off boards described in `Capstone_Submission.txt`.

## Files

| Path | Contents |
| --- | --- |
| `Capstone_Submission.txt` | Five-sentence pitch, desk research, persona summary, core problem, success measures, AI toolkit inventory, IA & flows, delivery evidence. |
| `interviews/` | Five transcripts (P1–P5), a combined transcript bundle, and the simulated-data provenance note. |
| `personas/` | Persona cards, journey map, verification log, PM guide, prompts and extraction script. |
| `research/` | Source notes, synthesis and verification, a one-page summary, and three competitor screenshots. |
| Root `*.svg` | The five phone wireframes and the larger page exports. |

`Capstone_Submission.txt` records the Figma design and prototype URLs and the delivery QA checks; those are descriptions of work done in Figma, not code in this repository.
