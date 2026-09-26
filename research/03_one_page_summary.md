# DoseDay — Research Summary (one page)

**Project:** DoseDay, an accessible medication companion for adults managing multiple prescriptions.
**Evidence base:** 8 desk-research sources — 3 competitor/analog products (screenshotted), 4
articles/reports (all link-checked), 22 real user reviews from the Apple App Store (20), Google Play
(1) and Reddit (1). Plus a Claude synthesis over those notes, hand-verified claim by claim.
**Date:** 2026-09-26. **Full detail:** `01_source_notes.md`, `02_synthesis_and_verification.md`.

---

## Top 5 findings

### 1. The reminder is half the product. The record is the other half.
Users are not asking to be nagged; they are asking to stop *not knowing* whether they already took
something. The value is in answering "did I take it?" and "when did I take it?", not in firing an
alarm.
**Sources:** GeekyDragonfly, App Store 05/04/2022 — "no more guessing whether I took a medicine or
not … and what time I actually took it"; Meinnm505, App Store May 5 — "It took the guess work out of
the equation"; LiinaLatrell, App Store Jan 19 — "This stops all that confusion"; rlsmith1994, App
Store Jun 9 — "you have to mark your pills as taken … it doesn't go away if you don't take your
meds."

### 2. Reminder frequency is table stakes. Scheduling *arithmetic* is where products break.
Every app in the independent Frontiers evaluation scored full marks on "provides a reminder
function" — reminding differentiates nobody. What breaks is any regimen that is not a clean daily
time: 2-hourly dosing, food-relative timing, "1 or 2 tablets per dose", weekend-only, 1×/week to
3×/day.
**Sources:** Frontiers in Medical Technology 2021 (criterion 16, full marks across all 8 apps
scored) — frontiersin.org; SF Cavendish, App Store 11/23/2021 — "I'm reasonably sure that there's a
way to enter that into the app, but I've given up"; MikeyBGr8, App Store 01/19/2022 — "the start and
end date option doesn't take into account for the frequency"; GeekyDragonfly 05/04/2022; Linda Smith,
Google Play 31 July 2026 — "My meds vary from 1x week to 3x/day."

### 3. Interface depth is an accessibility problem, and users name the mechanism themselves.
Reviewers do not say "too many menus." They say the people using this software may be cognitively
impaired by their condition or by the medication itself.
**Sources:** tuxedoyam, App Store 12/25/2021 — "people taking medications might also have some
degree of brain fog or mental impairment either due to the condition or as a side effect of
medication … core features easy to access without having to tap through multiple menus
repeatedly"; andrewleesh, App Store SG 16/07/2020 — "it takes 4 taps on tiny icons over various
parts of the screen"; SF Cavendish 11/23/2021 — "several separate groups working on developing
different parts of the interface, but they didn't talk to each other." Corroborated by the
literature: PMC5694345, common failures in older-adult medication apps are "difficult navigation,
poor visibility, inflexible reminders, and too much manual entry."

### 4. Reminder persistence means opposite things depending on how many people share the record.
Escalating reminders are a feature for someone dosing alone on one phone, and a fault in a
two-carer household — where one person marks the dose taken and the other phone keeps firing.
The variable is not preference; it is the number of writers.
**Sources:** rlsmith1994 Jun 9 and eventidephoenix, App Store 10/10/2018 ("You get multiple
notifications until you take it … the only way to improve the app is to make it more annoying") for
the feature side; 123334567, App Store 08/06/2024 for the fault side — "My husband will mark
something taken, I'll get reminders on my device, and log in and see they're already marked. There's
a disconnect between taken status and notifications when using multiple devices/users, but we share
caretaking responsibilities."

### 5. In a medication app, reliability defects are trust defects — and one review describes the exact lockout we must not ship.
Being unable to add a medication, or a reminder that silently never arrived, breaks the only thing
the product is for.
**Sources:** CoastieWife74, App Store Mar 8 — "I have used Medisafe for years. Paid for the upgrade
… Now I have new meds to take and I can't add them to the app. I even tried deleting some and…nothing.
… I don't want to find a new app, but if this can't be resolved, I'll have to"; Reddit r/androidapps
— "I ran into an issue with not getting notifications at one point but it was the phone's battery
settings"; 123334567 08/06/2024 (multi-carer setup "took us a few tries"). The Reddit case matters
specifically because from the user's side "the app is broken" and "the reminder never arrived" are
indistinguishable.

---

## What the evidence does not support

Stated plainly, because a research page that only lists strengths is not a research page.

- **No current adherence rate.** The widely quoted ~50% figure is WHO 2003, for developed countries
  generally — not app users, not current. (A1)
- **No market size.** The 325,000 mHealth apps / 10,000 medication-reminder counts are 2017 figures
  from a single source. (A4)
- **No willingness to pay, and no pricing conclusion.** Hero's $29.99/month is a hardware +
  subscription price in a different category; the Philips $60 and MedMinder $50 comparison figures
  are an unverified claim on Hero's own marketing page.
- **No clinical outcome.** The one outcome-shaped anecdote (a caregiver alert leading to EMS) sits in
  the vendor-selected testimonial set and is excluded from the evidence base by rule, because a
  vendor choosing its own testimonials is not a sample.
- **No "users want X" statistics.** 22 self-selected reviews are 22 people. A theme with 3
  supporting reviews is three people. Nothing here is a majority, a percentage, or a rate.
- **No usability finding about DoseDay.** It does not exist yet. Every usability point above is
  about a competitor or an analog.
- **No interviews.** The `interviews/` corpus in this repo is a separate, explicitly SIMULATED
  practice dataset for the AI-persona pipeline. It is not evidence for this brief and is not used
  anywhere above.

---

## How the AI was used, and where it was corrected

Raw notes were attached to an authenticated Claude session and asked for themes, contradictions,
unmet needs, and an explicit "what this does not support" section, under a closed citation set
(R1–R22, A1–A4) and a minimum-evidence rule. The full prompt is in
`02_synthesis_and_verification.md` Part 1.

**42 claims checked by hand, 36 passed, 6 failed.** Claude was cut where it overreached:

- It called Apple Health sync **UNSERVED** ("nobody offers it"). **Wrong, and reversed:** Medisafe's
  own store listing advertises HealthKit medication sync, while reviewer DAHM (May 10) reports
  maintaining two parallel records. Reclassified as *badly served and disputed* — a vendor
  advertising a capability its own user says is missing.
- It cited GeekyDragonfly as being "alerted" about drugs that can't be taken together. **Not
  supported:** R1 used the app's timestamp log to work out the spacing themselves. That left the
  theme with 2 supporting reviews, below its own 3-review threshold, so the theme was demoted from
  finding to observation.
- It listed **two themes that were the same finding** (relief from remembering / persistence of
  reminders). Merged after one citation was reallocated.
- It reframed CoastieWife74's app malfunction as a "cap" on adding medications. **Misframed:** it
  reads as a defect, which makes it a more urgent requirement, not a pricing complaint.
- Two smaller labelling errors, corrected in place.

Claude also **flagged one of its own themes as WEAK** for having only 2 supporting reviews and
refused to promote it — the behaviour the prompt was written to produce, and the reason the rest
could be checked rather than trusted.

**One finding is mine, not Claude's, and is an absence rather than evidence:** none of the 22
reviewers mentions streaks, gamification, or scores in any form — but MyTherapy's store listing
advertises "Motivation with Streaks to stay consistent" as a headline benefit. A broken streak
punishes precisely the missed night that made our primary user delete an otherwise good app. This
is recorded as a design *constraint*, with zero user evidence behind it, and it is not counted as a
finding.

---

## What this research changed in the product

1. The Today screen leads with a **record**, not a countdown — the primary question is "what's
   already done", with the next action second.
2. Dose entry supports **variable amounts and irregular frequency** (Finding 2), including
   as-needed doses that are logged but never nagged.
3. Reminder escalation **branches on whether anyone else shares the record** (Finding 4): relentless
   when the user is alone, suppressed the moment a dose is marked anywhere.
4. No streaks, no scores, no red-for-missed state. A missed dose is a **reversible check-in**, never
   a judgement.
5. Adding a medication can never be blocked, and "the reminder did not arrive" is a state the
   product must be able to explain (Finding 5).
