---
name: madmattskills
description: Engineering-fundamentals workflow for AI coding (after Matt Pocock's "Workflow for AI Coding"). Use when starting any non-trivial feature, bug, or refactor; when the user says "grill me", "write a PRD", "PRD to issues", "break this into issues/tickets", "tracer bullets", "vertical slices", "TDD", "red-green-refactor", "ralph loop", "AFK", "improve architecture", "deep modules", or "review this in fresh context"; or invokes /madmattskills with a mode (grill, prd, issues, afk, tdd, architecture, review).
argument-hint: "[grill|prd|issues|afk|tdd|architecture|review] <brief, file or issue>"
---

# madmattskills

A small, owned workflow for building software with agents. Software engineering
fundamentals (Fowler, Hunt & Thomas, Brooks, Ousterhout) are not replaced by AI —
they matter more. **The code is the battleground:** never do "specs-to-code"
(editing a spec and regenerating while ignoring the code). Keep the module map
in mind from grilling to review.

## Modes

Pick the mode from the argument. With no argument, infer it from the request;
if the request is a fresh idea or brief, start with `grill`.

| Mode | When | Loop | Read |
|---|---|---|---|
| `grill` | New idea, brief, transcript, vague ask | HITL | `references/grill-me.md` |
| `prd` | Alignment reached, need the destination doc | HITL | `references/write-a-prd.md`, `templates/prd.md` |
| `issues` | PRD exists, need the journey (task DAG) | HITL | `references/prd-to-issues.md`, `templates/issue.md` |
| `afk` / `tdd` | Implement one issue autonomously | AFK | `references/tdd.md`, `references/afk-loop.md` |
| `architecture` | Codebase is hard for agents to work in | HITL | `references/improve-codebase-architecture.md` |
| `review` | Code is written; review before human QA | AFK | `references/review.md` |

Read the referenced file for the active mode **before** acting. Do not load the
others — pull context only when needed.

## The flow

```
idea ─► grill ─► prd ─► issues (kanban DAG) ─► afk TDD loop ─► review ─► human QA
 ▲     (HITL)   (dest)   (journey, HITL)       (night shift)   (fresh ctx)   │
 └──────────────── QA findings become new issues on the board ◄──────────────┘
```

Day shift (human in the loop): grill, PRD, issues, QA. Night shift (away from
keyboard): implementation and automated review. Planning/alignment is never
AFK; implementation should be.

## Non-negotiable rules

1. **Stay in the smart zone.** Reasoning degrades past ~100k tokens regardless
   of window size. Size tasks so one issue fits in one fresh session. Delegate
   broad exploration to subagents so only their summary lands in your context.
2. **Clear, don't compact.** Prefer a fresh session per work unit (the Memento
   principle). Compaction leaves sediment. Keep always-loaded context (CLAUDE.md,
   system prompt) tiny.
3. **Align before planning.** Don't rush to a plan. Reach a shared design
   concept by interviewing the human one question at a time, each with a
   recommended answer.
4. **Vertical slices only.** Every issue is a tracer bullet cutting through every
   layer it needs (schema + service + route + minimal UI) and ends with something
   demoable. Reject "phase 1: DB, phase 2: API, phase 3: UI".
5. **Kanban DAG, not numbered phases.** Issues declare `Blocked by` so
   independent ones can run in parallel.
6. **TDD: red → green → refactor.** Write one failing test, watch it fail for
   the right reason, make it pass minimally, refactor. Never write the
   implementation before seeing red.
7. **Feedback loops are the ceiling.** Run tests, typecheck, and lint before
   every commit. Bad output usually means weak feedback loops — improve them.
8. **Deep modules.** Small interface, lots of behaviour behind it, one wide test
   boundary around it. The human owns interfaces; the agent fills in internals.
9. **Review in a fresh context** with coding standards *pushed* in alongside
   the diff. During implementation, standards are *pulled* on demand.
10. **Humans own taste.** Manual QA is where taste is imposed; QA produces new
    issues, not silent patches.
11. **No doc rot.** When an issue/PRD is done, close or delete it. Stale plans
    mislead future agents more than no plans.
12. **Own the stack.** These are plain markdown files and shell scripts. Tune
    them (e.g. fewer grilling questions) rather than working around them.

## Where artifacts live

Default to local markdown in the target repo unless the user says GitHub
Issues:

- `issues/prd-<slug>.md` — the destination doc
- `issues/NNN-<slug>.md` — one file per vertical slice
- Mark done by setting `Status: done` and removing it (or closing the GitHub
  issue) once the feature is QA'd.

Ask once which the user prefers if the repo already uses GitHub Issues.

## Quick checklist

- [ ] Context under ~100k? Fresh session per issue?
- [ ] Grilled before planning? Negative decisions captured?
- [ ] PRD has user stories, module map, testing decisions, out-of-scope?
- [ ] Each issue a vertical slice with a demoable result and `Blocked by`?
- [ ] Saw a failing test before writing code? Tests + types + lint green?
- [ ] Modules deep, tested at their interface, not per helper?
- [ ] Reviewed in a fresh context with standards pushed in?
- [ ] Human QA done, findings turned into issues, finished docs removed?
