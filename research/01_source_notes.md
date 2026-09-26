# DoseDay — Desk Research Source Notes (raw)

Collected 2026-09-26. These are the raw notes fed to the synthesis step. Nothing here is
interpreted; interpretation happens in `02_synthesis_and_verification.md`.

**Provenance rule used throughout:** every review below is quoted from a public app store
listing or a public forum thread, with username and date where the platform exposes them.
Reviews that a vendor selected and republished on its own marketing page are kept in a
separate section (§4) and are **not** counted toward the 20-review total, because a vendor
choosing its own testimonials is not a sample.

---

## 1. Competitor and analog products (3 captured, 4 discussed)

### 1.1 Medisafe — Medication Management (direct competitor, freemium app)
- App Store: https://apps.apple.com/us/app/medisafe-medication-management/id573916946
- Rating shown: 4.7 / 5, ~100K ratings
- Screenshot: `screenshots/competitor_01_medisafe_appstore.png`
- Self-described key flow, from the store listing: set up a medication → schedule dose
  times → get a push reminder → mark the dose taken → repeat. Extras advertised on the
  listing: HealthKit sync, a shareable PDF progress report for a doctor, "family
  interaction" so one account manages a whole family, refill reminders, and selectable
  reminder sounds ("Medtones", e.g. Darth Vader, Dr Evil, Elsa, "Nagging Mom").
- Structural observation: the app's own pitch leads with *shared family access*, not with
  the single user's dose. Sharing is the headline feature.

### 1.2 Meds & Pill Reminder MyTherapy (direct competitor, freemium app)
- App Store: https://apps.apple.com/us/app/pill-reminder-mytherapy/id662170995
- Google Play: https://play.google.com/store/apps/details?id=eu.smartpatient.mytherapy
- Rating shown on Google Play: 4.5 / 5, 237,756 ratings
- Screenshot: `screenshots/competitor_02_mytherapy_appstore.png`
- Self-described key flow, from the store listing: add medication (tablet, drop,
  injection, vitamin, supplement) → set a daily reminder → confirm or skip each intake →
  see streaks and a monthly health report. Extras: refill alerts, a health journal with
  symptom/pain diary, measurements (weight, blood pressure, oxygen, blood sugar), and
  "family profiles for shared care".
- Structural observation: gamification is load-bearing here — "Streaks" are advertised on
  the store listing as the motivation mechanic. A streak is a score. A missed day breaks
  it.

### 1.3 Hero: Medication Manager (different category — hardware + subscription)
- App Store: https://apps.apple.com/us/app/hero-medication-manager/id1352848484
- Google Play: https://play.google.com/store/apps/details?id=com.herohealth.heroconnect
- Screenshot: `screenshots/competitor_03_hero_appstore.png`
- Listed price: $29.99/month, on top of a physical smart dispenser
  (https://herohealth.com/caregivers)
- Key flow, from the vendor's own numbered walkthrough at https://herohealth.com/:
  install app → activate subscription → set up medication schedule and dose for each
  medication → physically load up to a 90-day supply into the dispenser → the dispenser
  sorts, locks and dispenses only the correct dose.
- Hard constraint stated on the store listing: "the Hero app requires an active Hero
  subscription and a connected smart dispenser. It does not work as a stand-alone
  application."
- Structural observation: Hero removes the *behavioural* problem with hardware — the
  device physically withholds the pill until you take it — and charges $30/month for it.
  It also caps the modelled regimen: 10 medications in the dispenser plus 10 more in the app.

### 1.4 Analog: the physical pill organizer and the talking pill bottle
No screenshot is possible for a physical object, so this analog is evidenced through user
testimony rather than a captured image. Both are named unprompted by Medisafe reviewers
describing what they used *before* the app:
- "even a talking pill box to remind me of every dose" — Paul B., via
  https://www.medisafe.com/medisafe-reviews (vendor page, so treated as §4 evidence)
- "It also shows a picture of the pill so I'm grabbing the right one out of the pill case
  since they are all together. Pill cases are great but not everything falls under the am,
  afternoon and pm schedule." — melanie605, App Store, 11/17/2019
- Physical sorting cost, from a Hero reviewer: "No more filling med boxes every 2 weeks
  that used to take over an hour, always had an error and I would occassionally forget to
  take." — Linda Smith, Google Play, 31 July 2026
- Competitor set the baseline for the same job: "Similar devices with subscription models
  like Philips ($60 a month) and MedMinder ($50 a month) are significantly more expensive
  and provide fewer features." — https://herohealth.com/medicine-reminder (vendor claim)

---

## 2. Articles and reports (4, all link-checked HTTP 200 on 2026-09-26)

**A1. WHO, 2003 — "Failure to take prescribed medicine for chronic diseases is a massive
world-wide problem"**
https://www.who.int/news/item/01-07-2003-failure-to-take-prescribed-medicine-for-chronic-diseases-is-a-massive-world-wide-problem
Claim used: adherence in developed countries averages about 50% for chronic-disease
medicines. This is a 2003 figure and is reported as such; it is not a current statistic.

**A2. CDC, 2017 Grand Rounds — Medication Adherence**
https://archive.cdc.gov/www_cdc_gov/grand-rounds/pp/2017/20170221-medication-adherence.html
Claim used: adherence barriers are multi-layered — complex dosing, side effects, cost, poor
care coordination, limited patient engagement.

**A3. PMC5694345 — usability problems in medication apps used by older adults**
https://pmc.ncbi.nlm.nih.gov/articles/PMC5694345/
Claim used: common usability failures are difficult navigation, poor visibility of key
information, inflexible reminders, and too much manual entry.

**A4. Frontiers in Medical Technology, 2021 — "Digital Medication Adherence Support: Could
Healthcare Providers Recommend Mobile Health Apps?"**
https://www.frontiersin.org/journals/medical-technology/articles/10.3389/fmedt.2020.616242/full
Newly added for this pass. Independently scored eight medication apps against a
functionality and security rubric. Findings used here:
- Scientific-app evaluation scores: Medisafe 59%, MyTherapy 56%, Meds on time 44%.
- Patient evaluation: Dosecast 3.83/5, Medisafe 3.62, SwissMeds 3.50.
- Every app scored full marks on "Reminders: text messages and push notifications"
  (criterion 16) — i.e. **reminding is table stakes and differentiates nobody**.
- Under "Security and privacy", Medisafe and MyTherapy scored 0/5 on criterion 1 (password)
  and 0 on funding disclosure; the category's privacy disclosure was poor across the board.
- Market context: of 325,000 mHealth apps available in 2017, about 10,000 were medication
  reminders.
This is the strongest single source in the set because it is independent, scored, and
comparative rather than vendor-reported.

---

## 3. Real user reviews (22, quoted with attribution)

### 3.1 Apple App Store — Medisafe, US listing, see-all reviews
Fetched 2026-09-26 from
https://apps.apple.com/us/app/medisafe-medication-management/id573916946?see-all=reviews

**R1. GeekyDragonfly, 05/04/2022 — "I never knew I needed this so much!!!" (positive)**
> "I have literally have to take medicine every two hours, so getting an alert instead of
> having to watch the clock is such a game changer for me! Also, no more guessing whether
> I took a medicine or not … and what time I actually took it (which is important for
> timing out my meds because I can't take certain meds too close together)."

**R2. 10 Star 1, 05/07/2024 — "Medisafe Medication Reminder" (positive)**
> "When I began I had no guidance in choosing a medication reminder application. I began
> with choosing several different apps. I looked through the ratings of all the health apps
> in the category… The learning curve is pretty easy to follow."
> "Recently I found I have been having an issue with tracking a medication so I sent a
> request for help message. The next morning I had an email from MediSafe with the
> information answer in my mail."

**R3. JBJ0507, 06/18/2022 — "App saved my life!" (positive, safety)**
> "Load the new med into the app and check for interactions and critical alert and red is
> what I see. Immediately call the pharmacist and not only could I not take the med at the
> time I was planning, I can't take it with 2 of my other critical meds."

**R4. melanie605, 11/17/2019 — "Extremely Helpful" (positive)**
> "With taking so many meds it's hard to remember what to take when. Some require I take so
> many hours after taking another. Or not eating so much time before or after taking it. Or
> take with full glass of water, take with or without food. It gets confusing."
> "It also shows a picture of the pill so I'm grabbing the right one out of the pill case
> since they are all together. Pill cases are great but not everything falls under the am,
> afternoon and pm schedule."
> "I was also able to forward to a friend of mine so he gets alerted after awhile if it
> recognizes I haven't taken them."

**R5. SF Cavendish, 11/23/2021 — "OK, but not great" (negative)**
> "the interface for the app seems confusing and even convoluted at times… it seems like
> the heart info team didn't talk to the other teams."
> "I have one Rx that I'm supposed to take 1 or 2 tablets/dose. I'm reasonably sure that
> there's a way to enter that into the app, but I've given up. It's common for drugs to be
> prescribed that way. It should be simple and obvious. It shouldn't require several trips
> through the documentation."

**R6. Inky0, 10/28/2025 — "Please add more med alerts" (constructive negative)**
> "This app doesn't have that many medsafe alerts. It has a lot of stuff like politics and
> adult shows… Right now the only kid sounds are Finding Dory and Starwars."
> "I just think adding more sounds will make this app more fun and useful for kids and
> teens, like myself."

**R7. MikeyBGr8, 01/19/2022 — "Almost a perfect app" (mixed)**
> "The one thing that could be better is the refill reminder calculation. For example my
> daughter only takes one of her meds only on the weekends. She get prescribed anywhere
> from 30 to 90 day supply. The issue is that the start and end date option doesn't take
> into account for the frequency."
> "Sure I could pull out a calendar and count the weekends until I reach 30 but I feel like
> that defeats the purpose of the feature."

**R8. tuxedoyam, 12/25/2021 — "Great in some ways" (negative)**
> "it's a bit bogged down for the average user. It's not as easy or intuitive to navigate as
> an app should be for people who need to take multiple medications multiple times a day.
> Taking into account that people taking medications might also have some degree of brain
> fog or mental impairment either due to the condition or as a side effect of medication,
> an app aimed at this demographic should have its core features easy to access without
> having to tap through multiple menus repeatedly."
> "I see this app advertised as #1 recommended by pharmacists, but what about the people who
> are actually using the app?"

**R9. 123334567, 08/06/2024 — "Good app but needs enhancements" (negative)**
> "Stop sending reminder notifications once the meds have been marked taken on any device.
> My husband will mark something taken, I'll get reminders on my device, and log in and see
> they're already marked. There's a disconnect between taken status and notifications when
> using multiple devices/users, but we share caretaking responsibilities."
> "setting up multiple users/caretakers was not intuitive- it took us a few tries. I wish
> that was a little easier and facilitated more than two caretakers for a person."

**R10. toneybarber, 08/27/2021 — "I Like This App, But…" (negative)**
> "Just today the developers cut down the number of free measurements from 6 to 3… When I
> clicked to exit the settings is when I was informed via pop-up that the limit was 3."
> "I am sure there are many folks who would pay a premium for multiple users. The rest is
> fluff. I'll use it for a while for mes management but will continue to search for
> something else."

**R11. LyricRainn, Jan 19 — "The PERFECT App!" (positive)**
> "as someone who is a walking pharmacy, it's been hard to find a decent medication reminder
> app. This has everything I've ever wanted and more! No ads, the ability to pause a pill's
> reminders temporarily, you being able to choose when you want to be reminded when to
> refill, repeated reminders, drug interaction checkers…"

**R12. Meinnm505, May 5 — "I Don't Know What I'd Do W/O This App!" (positive)**
> "I was diagnosed with a rare disease in 2019. I have several autoimmune diseases as well.
> I have to take several medications at certain times of the day, every day. It can be
> overwhelming. Medisafe makes it easy. It reminds me several times (On most days, I need
> all the reminders). It took the guess work out of the equation."

**R13. LiinaLatrell, Jan 19 — "Keeps me on schedule" (positive)**
> "I was forgetting to take my meds or trying to remember did I'd take certain ones at all.
> This stops all that confusion."

**R14. rlsmith1994, Jun 9 — "The best far and away" (positive)**
> "What I like is that you have to mark your pills as taken. Unlike reminders on the iPhone
> or other apps, it doesn't go away if you don't take your meds. The app will continually
> remind you."
> "The interface is soooo user friendly (not clunky and full of weird ads)."

**R15. DAHM, May 10 — "Need to sync meds with Apple health" (negative)**
> "Great app for reminding and family tracking but it should sync the med list and if taken
> with apple health. You shouldn't have to add the meds from scratch it should sync the meds
> and only need to manually touch the fields that apple did not have. Currently if you want
> to keep your meds in apple health you need to track both apps separately."

**R16. CoastieWife74, Mar 8 — "Long time user, but" (negative)**
> "I have used Medisafe for years. Paid for the upgrade to track kids' meds and even our
> senior dog. Now I have new meds to take and I can't add them to the app. I even tried
> deleting some and…nothing. I have 4 meds I need to track for a while and no way to add
> them. I don't want to find a new app, but if this can't be resolved, I'll have to."

### 3.2 Apple App Store — Medisafe, Singapore listing
https://apps.apple.com/sg/app/medisafe-pill-reminder/id573916946

**R17. andrewleesh, 16/07/2020 — "Lovely graphics but needs improvements" (negative)**
> "My biggest gripe is that it takes 4 taps on tiny icons over various parts of the screen
> to reach the interface to record blood pressure 😣 Please improve the app to allow
> shortcuts on the home screen."

**R18. eventidephoenix, 10/10/2018 — "It's annoying. I love it!" (positive, wants more)**
> "I needed an app to annoy me into remembering to take my meds. The folks did it right. You
> get multiple notifications until you take it. The only way to improve the app is to make
> it more annoying."

**R19. cpoppypop, 26/03/2021 — "Perfect app :)" (positive)**
> "I don't have any complaints! Maybe the team can work on making the interface a little
> prettier, if I had to choose a thing to fix."

**R20. retailassociate38, 26 Mar — "Great app for medication reminder" (positive)**
> "This app has an intuitive and easy-to-use interface, making it simple to set up and
> manage my daily medication reminders."

### 3.3 Google Play — Hero
https://play.google.com/store/apps/details?id=com.herohealth.heroconnect

**R21. Linda Smith, 31 July 2026 (positive)**
> "I love the HERO. It's taken away so much stress. My meds vary from 1x week to 3x/day and
> it's been amazing. No more filling med boxes every 2 weeks that used to take over an hour,
> always had an error and I would occassionally forget to take."

### 3.4 Reddit
**R22. r/androidapps, thread "I've been using Medisafe which is a Medication reminder app"
https://www.reddit.com/r/androidapps/comments/ru307m/**
> "You can set up individual notifications for each med and confirm taking them from the
> notification. You can also have no notifications for others, just a means to record 'as
> needed' pills. I ran into an issue with not getting notifications at one point but it was
> the phone's battery settings. That sorted, it has worked great for me."

Review count by source: Apple App Store 20, Google Play 1, Reddit 1. **Total 22.**
Positive 12, negative 10. Two competitors' worth of concentrated negative evidence sits on
the market leader, which is itself a finding.

---

## 4. Vendor-selected testimonials — recorded, NOT counted

Pulled from https://www.medisafe.com/medisafe-reviews and
https://medisafeapp.com/community-reviews. These are real people describing real outcomes,
but the vendor chose them, so they cannot establish what is *typical*:
- Denise J. — "I take 13 different medications at 5 times a day intervals."
- Amy S. — caregiver alert led to finding her post-stroke mother unresponsive and calling EMS.
- Paul B. — "long used notes, phone alarms, even a talking pill box."
- Malcolm W. — "I'm a doctor and still forget my 10am medications."
- An unnamed retired pharmacist, a nurse, and a 20-year pharmacist — all endorsing.
- A herohealth.com testimonial from Ira B. Wilson, MD, Brown University School of Public Health.
Used in this project only as evidence that these *kinds* of claims are made by vendors, so
that DoseDay's own copy avoids them.

---

## 5. What is deliberately absent from these notes

- No interview data. The `interviews/` corpus is a separate, explicitly SIMULATED artefact
  and is not evidence for this brief.
- No market sizing, no willingness to pay, no clinical outcome claims.
- No usability testing of DoseDay itself; nothing here has been validated with a user of
  this product, because it does not exist yet.
- No screenshots of the competitors' running apps. Only Apple/Google store listing pages
  were captured, because running the apps would require owning the hardware. The apps'
  internal screens are therefore described from vendor copy and reviewer testimony, and are
  labelled as such wherever used.
