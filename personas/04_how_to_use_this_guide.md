# How to use this pack — a 6-minute guide for PMs

**Who this is for:** a PM or a delivery lead who has to make a decision on
DoseDay this week and has never read an interview transcript.

**What this pack is:** 3 personas, 1 emotional journey map, 1 verification log,
built from 5 interviews (P1–P5) and then checked line-by-line against the raw
transcripts. Every claim in the personas is either quoted or marked as an
assumption. The verification log shows you exactly what the AI got wrong first —
and, in §3, the seven things **we** got wrong afterwards.

**The one thing to understand in 30 seconds:** these three personas do **not**
cover your whole market, and they are not three equal slices of it. They are
three *failure modes* of the same job — "take today's doses on time" — and each
one fails for a different reason. A feature that fixes one of them will make
another one worse. That trade-off is the reason this pack exists.

---

## The three personas at a glance

| Persona | Fails because | Design consequence |
| --- | --- | --- |
| **The Shifter** (P1, 59, "Rowan") | The app judged them. A red "missed" state made them delete a good app. | No shame states, ever. Reversible check-in. The app must know about shift work. |
| **The Unbothered** (P2, 34, "Jay") | The app asks for a record, and a record becomes a judgement. | Minimum viable interaction: one tap, no diary, no streak, no account. |
| **The Unanchored** (P3+P4, 67 and 45, "Ada" and "Ray") | Their routine lives somewhere a routine cannot follow. | The system must survive a missing routine: travel, no kitchen, a different kitchen. |

Two participants (P3, P4) were merged into one persona **on purpose**, and the
merge is logged as a design decision in the verification log — not hidden. It is
also the weakest thing in the pack: it was merged on a single shared failure and
has never been tested with either person on its own.

P5 (29) is the **critic, not a persona**. They have a working system and refused
every product in the pack's research. They are kept in a sidebar because their
objections are the ones that make the pack honest.

> **On names and pronouns.** First names are fictional and exist only so you can
> remember a person. P3 says "I'm a grown woman" and P4 says "I'm a grown man", so
> those two are written with gendered pronouns. **P1, P2 and P5 never state their
> own gender, so they are written neutral** — in the cards, in the map, and
> everywhere else. No job title appears for anyone except where a participant said
> it themselves: no employer, no industry, no "retired", no degree. A filename is
> not evidence.

---

## How to read a persona without fooling yourself

1. **Quotes are evidence, adjectives are decoration.** If a line has a quote
   and a participant code, you may build on it. If it does not, it is a
   hypothesis and must be researched. Every persona card is split into
   `Grounded (n)` and an **ASSUMPTIONS TO TEST** block, so you can see the ratio
   at a glance.
2. **Check the trap table in `interviews/00_README_DATA_PROVENANCE.md`.**
   Seven mistakes were planted in the corpus on purpose, and the table lists
   their correct answers. It was withheld from the extraction model, and that
   was verified by searching the saved conversation rather than assumed. If a
   persona statement contradicts that table, the statement is wrong.
3. **"ASSUMPTIONS TO TEST" lines are your research backlog.** They are not
   hedges. Each one names a question *and* a method, so it can be scheduled
   rather than argued about.
4. **Quotations are byte-identical or they carry an ellipsis.** If a quote reads
   too neatly, that is a warning. The pack contains four examples of this being
   caught — two in the model's draft, two in ours.

---

## How to use the emotional journey map

The map plots six moments in one day for the core task. Three rules:

- **Peaks are not where you want to spend effort.** The highest points are the
  07:20-in-the-morning-type moments where the pill is already attached to an
  existing anchor (coffee, the start of a shift). The product's job there is to
  stay out of the way. Do not add features at the peaks.
- **The troughs are the roadmap.** The three lowest points are where the
  evidence says the user is most likely to drop the product, abandon the routine,
  or skip a dose. Every feature priority should trace to a trough.
- **Valence is not effort.** A stage can be high-valence and still be the
  hardest to design (P3's "morning, two of them" is a 4-second tap she has to
  find first).
- **One row is one person.** The *Midday* stage rests on P4 alone. No other
  participant describes a midday dose problem, so that row is a hypothesis and
  the map says so on the row itself. Do not let a single-source row quietly
  become a requirement.
- **The negative numbers are the point.** Nothing on this map is emotionally
  positive except the last stage. The chart is not drawn to make the product
  look good.

The stage named *Late shifts / disrupted days* is the one your competitors do
not have. It is also where both of the highest-value features live: shift-aware
scheduling and a routine that travels. Note that this one stage is really three
separate mechanisms from three different participants — a rota that changes, a
routine that does not travel, and an unquantified fear of a single missed dose.
They were fused into a single emotional low in the AI's draft, which hid the
fact that they have three different fixes.

---

## How to use the verification log

The log is a table of every edit made to the AI's first draft. Use it three ways:

1. **To review the personas.** Any row marked `REJECT` or `CORRECT` is a
   place where the AI sounded confident and the evidence did not support it.
2. **To set your tolerance for AI output.** The log shows what a competent model
   does with 41 KB of verbatim research: roughly useful structure, a handful of
   confident fabrications, and a reliable instinct for the *shape* of the problem.
   Plan for a human verification pass every time; do not budget for zero.
3. **To defend the research.** If someone challenges a persona in a review, the
   log is the answer: quote code, quote line, verdict. It also shows you were
   not fooled, which is the thing reviewers actually want to know.

Two sections are worth five minutes on their own. **§2.6** is the model's hostile
review of its own draft, which we requested — useful, but not evidence of
independence, so it is logged separately. **§3** is the list of what *we* got
wrong afterwards, including one invented industry, one invented gender, and a
quote we tidied inside its own quotation marks. A verification log that only
lists the model's failures is marketing.

---

## What this pack does *not* tell you

- Anything about a real market size, willingness to pay, or clinical outcomes.
- Anything about how a person with **no** smartphone behaves. No participant
  represented that case, so the pack says nothing about it.
- Anything about medication correctness. DoseDay records what a clinician has
  already entered; it does not advise on medication, and no persona here should
  be read as clinical guidance.
- Whether the *simulated* corpus behaves like real interviews. It does not, by
  construction. When real transcripts arrive, regenerate the pack and diff the
  verification logs: the traps the new model falls into are the ones worth
  knowing.

---

## Decision checklist for a DoseDay planning session

- [ ] Does the proposed feature help someone at a **trough**, or decorate a peak?
- [ ] Which persona does this feature make **worse**, and is that trade named out loud?
- [ ] Is any new copy scolding, or does it imply a judgement about the user?
- [ ] Does the feature survive a week where the user's routine is completely different?
- [ ] Does the feature require creating an account, or more than one tap?
- [ ] Is every claim in the pitch traceable to a quote, or marked as an assumption?
