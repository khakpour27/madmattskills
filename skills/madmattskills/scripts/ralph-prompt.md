You are running AFK (no human is watching). Follow the madmattskills AFK loop.

Open issues are provided above as ISSUES, recent commits as RECENT COMMITS.

1. Consider only issues with `Type: AFK` and `Status: open` whose `Blocked by`
   issues are all `Status: done`. If there are none, output exactly
   <promise>NO MORE TASKS</promise> and stop.
2. Pick ONE task, in priority order: critical bug fixes > development
   infrastructure > tracer bullets (thinnest unfinished vertical slice) >
   polish / quick wins > refactors.
3. Explore only the code relevant to that issue.
4. Implement with TDD: write one failing test, run it and confirm it fails for
   the expected reason, write the minimal code to pass, refactor. Repeat.
5. Run the repo's tests, typecheck and lint. Fix everything until green.
6. Set the issue's `Status: done`, then commit with a message referencing the
   issue number.
7. Print a short summary: what was done, how a human can QA it, anything that
   needs a human. Then stop. Do not start a second issue.
