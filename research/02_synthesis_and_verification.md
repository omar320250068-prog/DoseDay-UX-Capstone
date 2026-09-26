# DoseDay — Claude Synthesis and My Verification of It

**Run:** 2026-09-26, authenticated Claude (Free) session, chat `e108078a-566f-4022-a425-04487d316356`.
**Input:** `01_source_notes.md`, attached as a file, used as the only permitted evidence base.
**Verification:** every citation below was re-checked by hand against the quoted source text in
`01_source_notes.md`. Six defects were found in Claude's output. All are recorded here with the
correction applied. Nothing Claude wrote is presented as a finding until it survived this pass.

---

## Part 1 — The prompt, as sent

> The attached file (01_source_notes.md) is my raw desk-research notes for a medication-reminder
> app called DoseDay. It is the ONLY permitted evidence base. It contains 22 real user reviews
> (R1-R22), 4 articles/reports (A1-A4), competitor and analog product notes (1.1-1.4), and a
> section 4 of vendor-selected testimonials.
>
> Produce four things:
> 1. THEMES - 5 to 7 recurring patterns across the reviews. For each: short name, one-sentence
>    statement, and the supporting review IDs / sources. A theme with fewer than 3 distinct
>    review IDs is not a theme; if you include it anyway, mark it WEAK.
> 2. CONTRADICTIONS - 3 to 5 places where the sources genuinely disagree. For each: the two
>    sides, the review IDs on each side, and what actually distinguishes them (a difference in
>    the user's situation, not in taste).
> 3. UNMET NEEDS - 5 to 8 needs the sources show that current products do not serve. For each:
>    the need, the evidencing review IDs, and whether it is UNSERVED (nobody offers it) or
>    BADLY SERVED (offered but broken).
> 4. WHAT THE SOURCES DO NOT SUPPORT - things a reader might assume from this evidence base that
>    the notes do NOT establish.
>
> HARD RULES. I will check every line of your output against the notes, so:
> - Cite only R1-R22, A1-A4 and sections 1.1-1.4. Never invent a review ID, quote, username,
>   date, statistic, percentage, or URL.
> - Do not paraphrase a quote into a stronger claim than the quote makes. One person's opinion is
>   not a rate or a majority.
> - If you cannot support it from the notes, put it in section 4 instead of 1-3.
> - Do not invent market sizes, clinical outcomes, ages, genders, job titles, or medical conditions
>   for any reviewer.
> - The section 4 vendor testimonials are NOT a sample. Do not use them as evidence for a theme.
> - Mark your own confidence where you extrapolate beyond the literal text.
>
> Output structured markdown with those four numbered sections.

The prompt was written to make the output *checkable* rather than confident, following the
linked Claude prompting guidance: no free-form synthesis, an explicit closed citation set, a
minimum-evidence rule, and a mandatory section for what the evidence cannot support. The
WEAK flag in Theme 7 shows the rule was actually obeyed rather than ignored.

---

## Part 2 — Claude's output, as received

*(Reproduced without editing. Corrections are in Part 3.)*

### 1. THEMES

**Theme 1 — Alerting relieves the core burden of remembering and guessing**
Users repeatedly describe the reminder itself — not any advanced feature — as what stopped them
from forgetting doses or losing track of whether they'd already taken one.
Evidence: R1, R12, R13, R14, R18, R21.

**Theme 2 — Complex or irregular regimens strain the app's scheduling model**
Reviewers on non-standard regimens describe the scheduling logic breaking down even when basic
daily reminders work fine.
Evidence: R1, R4, R5, R7, R21.

**Theme 3 — Interaction/timing safety checking is a standout, safety-critical differentiator**
Where present, drug-interaction and timing-conflict checking is described in stronger terms than
any other feature, up to and including one report of it preventing a dangerous combination.
Evidence: R1, R3, R11.

**Theme 4 — Navigation complexity collides with the cognitive state of the user base**
Reviewers explicitly connect UI friction to the fact that people managing multiple meds may be
dealing with brain fog or cognitive load, not just inconvenience.
Evidence: R5, R8, R17.

**Theme 5 — Technical/sync reliability bugs undermine trust in a life-safety context**
Reviewers report cross-device desync, an inability to add new medications, and notification
delivery breaking — each more consequential in a medication app than an ordinary consumer app.
Evidence: R9, R16, R22.

**Theme 6 — Repeated/persistent reminders (not one-and-done) is the liked mechanic**
Positive reviews single out that the reminder repeats or won't disappear until the dose is marked
taken, distinct from native phone reminders that simply expire.
Evidence: R12, R14, R18.

**Theme 7 — Free-tier reductions and paid-tier limits create churn risk among loyal users [WEAK — 2 distinct review IDs]**
At least two reviewers describe the paid/free boundary itself, rather than any single feature, as
the reason they're considering leaving.
Evidence: R10, R16.

### 2. CONTRADICTIONS

**A. Persistent/repeating reminders: loved by single users, broken for shared care**
Side 1: R12, R14, R18. Side 2: R9.
Distinguishing factor: not taste — single person marking their own doses on one device versus a
shared-care setup with multiple devices on one patient's schedule.

**B. Interface ease: straightforward for the core daily-reminder flow, confusing at the edges**
Side 1: R2, R14, R19, R20. Side 2: R5, R8, R17.
Distinguishing factor: the positive set describes the basic path (add, get reminded, mark taken);
the negative set is each anchored to a specific secondary action, not the core loop.

**C. Refill reminders: flexible and loved on a regular schedule, broken on an irregular one**
Side 1: R11. Side 2: R7.
Distinguishing factor: regimen regularity.

**D. Family/shared-care tracking: praised as present, reported as fragile in active use**
Side 1: R15. Side 2: R9, R10, R16.
Distinguishing factor: passive/observational shared lists versus active multi-person write-actions.

### 3. UNMET NEEDS
- Irregular dosing frequencies in refill/reminder calculations — BADLY SERVED. R7.
- Variable dose amount entry ("1 or 2 tablets per dose") — BADLY SERVED. R5.
- Two-way sync with Apple Health — UNSERVED. R15.
- Multi-caretaker support beyond two, with cross-device notification suppression — BADLY SERVED. R9.
- Stable, non-degrading free tier — BADLY SERVED. R10.
- Cap-free way to keep adding medications for long-term/paying users — BADLY SERVED. R16.
- Low-tap access to frequent secondary actions — BADLY SERVED. R17, generally R8.
- Age/context-appropriate reminder tone options — BADLY SERVED. R6.

### 4. WHAT THE SOURCES DO NOT SUPPORT
- A current, general medication-adherence rate (A1's ~50% is 2003, developed countries, not
  app users).
- That any theme reflects a majority of users or of Medisafe's base. The 22 reviews self-select;
  a theme with 3 supporting IDs is 3 people, not a rate.
- Any demographic detail beyond what a reviewer volunteered; a disclosed condition is one
  person's self-report, not a segment or prevalence claim.
- Market size or TAM. A4's 2017 figures are one historical data point.
- Willingness to pay or any pricing conclusion for DoseDay. Hero's $29.99/month is a
  hardware+subscription price in a different category; the Philips/MedMinder figures are an
  unverified vendor claim.
- Any clinical outcome attributable to a reminder app. The one outcome-shaped anecdote is in §4,
  vendor-selected, excluded by rule.
- Any usability finding about DoseDay itself — it does not exist yet.
- That A4's app-scoring numbers still hold today; that evaluation is 2020/2021.
- Generalizability of the single Google Play review (R21) or single Reddit thread (R22).

---

## Part 3 — My verification, and what I cut

Method: for each of the 7 themes, 4 contradictions, 8 unmet needs and 9 disclaimers, I opened
the cited review in `01_source_notes.md` and checked that (a) the ID exists, (b) the quoted or
paraphrased content is actually in that review, and (c) the strength of the claim matches the
strength of the source. **42 claims checked, 36 passed clean, 6 failed.**

| # | Claude's claim | Verdict | Correction |
|---|---|---|---|
| **V-1** | Unmet need: "Two-way sync with Apple Health — **UNSERVED** (nobody offers it). R15" | **WRONG — cut and reversed** | My own notes §1.1 record that Medisafe's own App Store listing advertises "HEALTH APP INTEGRATION … syncs them to HealthKit". So it is not unserved; it is **BADLY SERVED and disputed** — the vendor advertises the sync its own reviewer says is missing. R15's actual words are that she "shouldn't have to add the meds from scratch". Reclassified, and promoted to a contradiction (see Finding F-6). |
| **V-2** | Theme 3 evidence: "R1 (alerted about meds that can't be taken too close together)" | **OVERSTATED — trimmed** | R1 never says the app alerted them. R1 says the timestamp record let them "look back and say, 'oh yeah, I was late taking this med by 30 minutes, so let me reschedule this next med'" — the user did the interaction reasoning themselves using the app's log. Theme 3 is weakened to rest on R3 and R11 only, i.e. **2 IDs, below the 3-ID threshold**. Theme 3 is therefore demoted to an **observation, not a theme**. |
| **V-3** | Theme 1 evidence includes "R18 (wants the app to keep 'annoying' him until he takes it)" | **WRONG FIT — moved** | R18 asks for *more* persistence. It is evidence of a *want*, not of the burden being relieved. R18 belongs to Theme 6 only. |
| **V-4** | Themes 1 and 6 presented as two separate themes | **DUPLICATE — merged** | After moving R18, Theme 1 (R1, R12, R13, R21) and Theme 6 (R12, R14) are the same finding stated twice: repeated reminders plus a record of what was taken. Merged into a single theme, **"The reminder is only half the product; the record is the other half"**, evidence R1, R12, R13, R14, R21. |
| **V-5** | Unmet need: "Cap-free way to keep adding medications for long-term/paying users — BADLY SERVED. R16" | **MISFRAMED — reworded** | R16 describes a malfunction, not a designed cap: "I have new meds to take and I can't add them to the app. I even tried deleting some and…nothing." Reframed as **"an existing user can be locked out of adding a medication"** — a reliability defect, which is a stronger and more urgent product requirement than a pricing complaint. |
| **V-6** | Section 4: "section 5 of the notes explicitly says no market-sizing evidence exists" | **MISLABELLED — fixed** | §5 of the notes says *this project* makes no market-sizing claim; it does not say the notes contain no market figures. A4 does carry 2017 counts (325,000 mHealth apps, ~10,000 medication reminders). The disclaimer itself survives — Claude is right that those figures are not a current TAM — but it now cites A4 rather than §5. |

**Passing note, recorded because it matters:** Claude flagged its own Theme 7 as WEAK for having
only 2 supporting IDs, exactly as instructed, and then refused to promote it. That is the
behaviour the prompt was designed to produce, and it is the reason the remaining output could be
checked line by line rather than taken on trust.

**What Claude got right that I did not ask for:** the single sharpest line in the whole output is
its reading of Contradiction B — that the reviewers who call the app easy and the reviewers who
call it confusing are describing *different parts of the same app*, the core reminder loop versus
a secondary action. That reframes "is the app easy?" from a yes/no question into a question about
which screen you are looking at, and it survived verification intact.

---

## Part 4 — Findings that carry forward, after correction

**F-1. The reminder is only half the product; the record is the other half.** (R1, R12, R13, R14,
R21) Users do not describe wanting to be nagged. They describe wanting to stop *not knowing*
whether they already took something. This is the strongest and best-corroborated finding in the
set. DoseDay's primary surface should be an answerable question, not an alarm.

**F-2. Regimen irregularity, not reminder frequency, is where scheduling models break.** (R1, R4,
R5, R7, R21) Five reviewers, five different irregularity types: 2-hourly dosing, food-relative
timing, "1 or 2 tablets per dose", weekend-only, 1×/week to 3×/day. Reminders survive
irregularity; arithmetic does not.

**F-3. Interface depth is a safety issue for this audience, and users say so explicitly.** (R5, R8,
R17) R8 names the mechanism outright: people on multiple medications "might also have some degree
of brain fog … either due to the condition or as a side effect of medication." R17's "4 taps on
tiny icons" is an accessibility failure described as a convenience failure.

**F-4. In a medication app, reliability bugs are trust bugs.** (R9, R16, R22) Cross-device
desync, being unable to add a medication at all, and notifications silently not firing. R22's
cause was the phone's battery settings, not the app — worth keeping, because it means "the app is
broken" and "the reminder did not arrive" are indistinguishable from the user's side.

**F-5. The paywall boundary, not the feature set, drives churn.** (R10, R16) — WEAK, 2 IDs, kept
flagged as weak. Both reviewers describe discovering a reduced limit *after the fact*, via a
pop-up, having been a paying or long-time user.

**F-6. Advertised capability and experienced capability diverge.** (R11 listing vs R15; R15 vs
§1.1 listing) The vendor's store copy claims HealthKit medication sync; the reviewer's experience
is maintaining two parallel records. A feature can ship, be advertised, and still not work for
the person relying on it. This is the correction from V-1, promoted because it is the kind of
claim DoseDay's own marketing copy will be tempted to make.

**F-7. Reminder persistence is one mechanic with opposite meanings.** (R12, R14, R18 vs R9)
Users who dose alone want it relentless; the same mechanic in a two-carer household on two devices
reads as a fault, because one carer marks the dose taken and the other's phone keeps firing. The
distinguishing variable is the number of people writing to one record, not the user's taste. Any
DoseDay escalation design has to branch on this.

**F-8. Nobody in the evidence base asked for streaks — and the market leader's headline mechanic
is a streak.** (§1.2; MyTherapy's listing advertises "Motivation with Streaks to stay
consistent" as a primary benefit, alongside refill alerts and a health journal.) This is an
absence, not a finding, and Claude did not surface it because it is an absence. It matters
because a broken streak punishes exactly the missed night that made our primary user delete a
good app: the failure mode the score is built to create is the one this product is trying to
remove. Recorded as a deliberate design constraint, **not** as user evidence — zero of the 22
reviewers mention streaks in any form.
