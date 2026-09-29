# Mode: afk (Ralph loop / night shift)

Goal: implement **one** issue per fresh session, autonomously, with TDD and
feedback loops, then commit and stop.

## Per-iteration instructions (what the agent does)

1. Read all open issues (they are provided in context by the loop script, or
   read `issues/*.md`). Read the last few commits to see what just happened.
2. Only consider `Type: AFK` issues whose `Blocked by` issues are all done.
   If none remain, output exactly `<promise>NO MORE TASKS</promise>` and stop.
3. Pick the next task in this priority order:
   1. critical bug fixes
   2. development infrastructure (feedback loops, test helpers)
   3. tracer bullets (the thinnest unfinished vertical slice)
   4. polish and quick wins
   5. refactors
4. Explore only the code relevant to that issue (subagent for broad search).
5. Implement with red → green → refactor (`tdd.md`).
6. Run tests, typecheck, lint. Fix until green.
7. Commit with a message referencing the issue. Set the issue's
   `Status: done` (or comment/close on GitHub).
8. Print a short summary: what was done, how to QA it manually, anything
   left for a human. Then stop — the next issue gets a fresh context.

## Running it

Scripts in `scripts/` of this skill (copy them into the target repo, e.g.
`scripts/ralph/`, and tune them — own your stack):

- `ralph-once.sh` — one iteration, human watching. Run this repeatedly at
  first to learn how the agent behaves and tune `ralph-prompt.md`.
- `ralph-afk.sh [max_iterations]` — loops until `NO MORE TASKS` or the cap.
  Run it inside a sandbox (Docker, devcontainer, or a git worktree on a
  throwaway branch) because it skips permission prompts for edits.

## Safety

- Issue text goes straight into an agent that edits files unattended. Only
  loop over issues written by you or trusted teammates; an issue from a
  stranger is a prompt-injection vector.
- Run the AFK loop in a sandbox with no production credentials (no cloud keys,
  no deploy tokens, no `.env` with real secrets) and only the network access it
  needs.
- Work on a throwaway branch or worktree and review the diff before merging.

## Parallel version

For issues in the same DAG wave: one git worktree/branch per issue, one
sandboxed agent per worktree running the per-iteration instructions for its
assigned issue, then an automated fresh-context review (`review.md`) of each
branch, then a merger agent that merges the branches and fixes type/test
conflicts. Use cheaper models to implement and the strongest model to review.
