# Mode: review

Goal: catch bugs before human QA, reviewing from the **smart zone**.

## Setup

- Review in a **fresh context** (new session or subagent), never at the tail of
  a long implementation session — that reviewer is in the dumb zone and is
  dumber than the implementer.
- Prefer the strongest available model for review.
- **Push** the standards in: include the repo's coding standards (CLAUDE.md,
  CONTRIBUTING, lint rules, relevant project skills) in the reviewer's prompt
  alongside the diff and the issue. Implementers *pull* standards on demand;
  reviewers get them pushed.

## Instructions

1. Inputs: the issue file, the PRD path, `git diff <base>...HEAD`, the standards.
2. Review the **tests first**: do they test behaviour at the module interface?
   Would they fail if the feature were broken? Any tests that just mirror the
   implementation?
3. Then the code: correctness against acceptance criteria, edge cases raised in
   grilling, module boundaries respected (no new shallow modules), standards.
4. Run the feedback loops yourself; don't trust the implementer's summary.
5. Output findings ranked by severity with file:line and a concrete fix. Fix
   clear-cut issues directly if you are running AFK; leave taste calls to the
   human.

## Human QA (not automatable)

The human runs the feature end to end and imposes taste. Every QA finding
becomes a new issue on the board (with `Blocked by` if needed) rather than an
untracked patch. When the feature is accepted, remove or close the PRD and
issues to prevent doc rot.
