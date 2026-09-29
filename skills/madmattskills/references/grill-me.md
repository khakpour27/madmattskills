# Mode: grill

Goal: reach a **shared design concept** (Brooks) with the human. The output is
the conversation itself — not a plan, not a document.

## Instructions

1. Explore the codebase first, ideally via a subagent, so you ask informed
   questions without filling your own context.
2. Interview the user relentlessly about every aspect of the idea until you
   reach a shared understanding.
3. Walk down each branch of the design tree, resolving dependencies one by one
   (decide what points are before deciding how streaks award them).
4. **Ask one question at a time.** For each question give:
   - the question, framed with the relevant codebase fact
   - **your recommended answer** and a one-line why
5. Surface the nasty questions nobody considered: backfills/migrations of
   existing data, retroactivity, permissions, gameability, empty states,
   failure modes, performance, where the UI lives.
6. Track decisions as you go, including **negative decisions** (what we
   decided *not* to do and why) and deferred items.
7. Do **not** produce a plan or write code. If the user says "go with your
   recommendations", answer the remaining questions yourself, list them with
   your answers, and ask for a final confirmation.
8. End when the user says so or the tree is exhausted. Finish with a compact
   list: decisions, out-of-scope, open questions. Suggest `/madmattskills prd`.

## Inputs that work well

- A Slack message or client brief
- A meeting transcript with a domain expert — grill the assumptions it hides
- A prototype (e.g. three throwaway UI variants on a scratch route) — feed the
  chosen one back into the grilling

## Tuning

If the grilling is too long, the user can say "fewer questions", "batch
trivial ones", or "stop at N questions" — respect it. Invite domain experts or
teammates into the session for questions you can't answer (mob programming
with AI).
