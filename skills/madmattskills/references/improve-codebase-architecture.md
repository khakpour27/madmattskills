# Mode: architecture

Goal: find places to **deepen modules** (Ousterhout) so agents can navigate,
change, and test the codebase. Bad codebases make bad agents.

## Concepts

- **Shallow modules:** many small files, each exporting a few things, tangled
  dependencies. Agents must trace the whole graph; tests end up wrapped around
  every tiny function with heavy mocking; bugs hide in the ordering between
  modules.
- **Deep modules:** a small, simple interface hiding a lot of behaviour. One
  wide test boundary catches most bugs. Callers stay simple.
- **Gray boxes:** the human designs and remembers the interface; the agent owns
  the internals. You keep a mental map of the codebase without reviewing every
  line inside every module.

## Instructions

1. Explore the architecture (subagents per area for large repos): entry points,
   services, dependency graph, where tests exist and where they don't.
2. Identify **candidate clusters** — groups of shallow modules that change
   together and could sit behind one interface.
3. For each candidate report:
   - modules in the cluster and why they are coupled
   - proposed interface (signatures/types) for the deepened module
   - dependency category: pure / local-substitutable (e.g. in-memory DB) /
     remote (needs a fake or contract test)
   - current test coverage and the test boundary you would draw
   - expected payoff (bugs caught, agent navigability) and risk
4. Rank candidates; call out the biggest untested-logic gap first.
5. Do not refactor yet. Offer to turn the chosen candidate into a PRD / issues
   (refactor issues are their own slices, test-first: pin behaviour at the new
   interface, then move code behind it).
