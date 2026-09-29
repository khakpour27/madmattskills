# Mode: prd

Goal: turn the design concept into a **destination document** — what "done"
looks like. It is an execution asset for the agent that splits it into issues,
not something the human needs to proofread (alignment already happened in the
grilling).

## Instructions

1. If no grilling happened in this session, ask the user for a long, detailed
   description of the problem, then run a short grilling pass (see
   `grill-me.md`). Grilling first is strongly preferred.
2. Explore the repo (subagent) if you have not already.
3. **Propose the module map before writing**: which modules are new, which are
   modified, and which new module is the deep one that carries the logic and
   gets the tests. Show the proposed interface of each new deep module. Get a
   yes from the user.
4. Write the PRD using `templates/prd.md`. Fill every section; keep user stories
   concrete and testable.
5. Save to `issues/prd-<slug>.md` (or a GitHub issue if the user uses them).
   Never create GitHub issues unless the user asked for GitHub.
6. Suggest `/madmattskills issues` next, ideally in a fresh session.

## Rules

- Out of scope is mandatory — it is where negative decisions go and what makes
  "done" definable.
- Name real files, services, tables, and routes from the codebase. This is not
  specs-to-code; the code shape is part of the spec.
- Don't polish the PRD endlessly. It is a hint of the destination; the value is
  in alignment and QA.
