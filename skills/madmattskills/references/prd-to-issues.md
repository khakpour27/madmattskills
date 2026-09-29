# Mode: issues

Goal: turn the PRD into the **journey** — independently grabbable issues forming
a kanban DAG that one or many AFK agents can pick up.

## Instructions

1. Locate the PRD (`issues/prd-*.md`, a GitHub issue, or the conversation). If
   this is a fresh session, explore the codebase via a subagent.
2. Draft **vertical slices (tracer bullets)**. Each slice:
   - cuts through every layer it needs: schema/migration + service logic +
     route/API + a minimal visible UI or CLI entry point
   - ends with something a human can see or run (a tracer you can aim with)
   - is small enough to finish, with tests, in one fresh session (<100k tokens)
   - lists which PRD user stories it covers
3. Check the first slice especially hard. "Create the service" or "add the
   schema" alone is horizontal — reject it. The first slice should be the
   thinnest end-to-end path (e.g. "award points for lesson completion, visible
   on dashboard").
4. For each slice set:
   - `Type: AFK` (agent can do it alone) or `Type: HITL` (needs human decisions,
     design taste, credentials, or UI judgment)
   - `Blocked by:` issue numbers, or `none`
5. Present the list as a table (number, title, type, blocked by, stories) and
   quiz the user: too horizontal? too big? missing dependency? Iterate.
6. On approval write one file per issue with `templates/issue.md` to
   `issues/NNN-<slug>.md`, referencing the local PRD path. Only use GitHub
   Issues if the user asked.
7. Show the DAG as waves: wave 1 = no blockers, wave 2 = blocked only by wave 1,
   etc. Items in the same wave can run in parallel.

## Anti-patterns

- Phase 1 DB / Phase 2 API / Phase 3 UI — zero integrated feedback until the end
- Numbered sequential plans — only one agent can work them
- Issues that say "and write tests" at the end — tests are part of every slice
- Refactor-only issues bundled into feature slices
