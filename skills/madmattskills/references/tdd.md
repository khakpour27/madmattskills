# Red → Green → Refactor

TDD is how an agent avoids coding blind and avoids writing tests that cheat
(implementation first, then tests shaped to whatever the code happens to do).

## The loop — one behaviour at a time

1. **Red.** Pick the next smallest behaviour from the issue. Write *one* test
   for it at the module's public interface. Run it. Confirm it fails **for the
   expected reason** (assertion failure or missing export — not a typo, a
   broken import, or a config error). If it fails for the wrong reason, fix the
   test first.
2. **Green.** Write the minimal code to make that test pass. Run the test.
   Then run the full suite.
3. **Refactor.** Clean up names, duplication, and structure with the suite
   green. Re-run.
4. Repeat until the issue's acceptance criteria are covered.

## Rules

- Never write implementation before you have observed red.
- Test behaviour through the deep module's interface, not private helpers.
  Avoid mocking internals; use real collaborators or substitutable ones (e.g.
  in-memory/SQLite test DB) at the boundary.
- One wide test boundary around the module beats many tiny ones around each
  function.
- If something is genuinely hard to test (visual UI), test the service/logic
  beneath it and leave the visual check to human QA — say so in the summary.
- Use the repo's existing test helpers and patterns; find them before writing
  new ones.

## Feedback loops before every commit

Discover and run the repo's own commands (check `package.json`, `Makefile`,
`pyproject.toml`, `Cargo.toml`, CI config):

- tests (`npm test`, `pytest`, `cargo test`, `go test ./...`)
- typecheck (`tsc --noEmit`, `mypy`, `pyright`)
- lint/format

Fix every failure in-session. If a repo lacks a feedback loop, say so — the
quality of feedback loops is the ceiling on agent output.
