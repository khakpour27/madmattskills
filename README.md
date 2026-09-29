# madmattskills

A portable Claude Code skill for AI-assisted software engineering, based on
Matt Pocock's "Workflow for AI Coding": software engineering fundamentals over
vibe coding.

```
idea → grill → PRD → vertical-slice issues (kanban DAG) → AFK TDD loop → fresh-context review → human QA
```

## Install (once, then use it in every project)

**Option A: Claude Code plugin marketplace** (works in the CLI, desktop, and web)

```
/plugin marketplace add khakpour27/madmattskills
/plugin install madmattskills@madmattskills
```

Invoke it as `/madmattskills:madmattskills <mode>`, or let Claude load it
automatically when you describe the task.

**Option B: personal skill** (shorter command: `/madmattskills`)

```bash
git clone https://github.com/khakpour27/madmattskills.git ~/code/madmattskills
~/code/madmattskills/install.sh          # symlinks into ~/.claude/skills; git pull to update
# or: ./install.sh --copy
```

**Team or per-repo:** copy `skills/madmattskills` into the repo's
`.claude/skills/`, or add the marketplace to the repo's `.claude/settings.json`:

```json
{
  "extraKnownMarketplaces": {
    "madmattskills": { "source": { "source": "github", "repo": "khakpour27/madmattskills" } }
  },
  "enabledPlugins": { "madmattskills@madmattskills": true }
}
```

## Modes

| Command | What it does |
|---|---|
| `/madmattskills grill <brief>` | Interviews you one question at a time, each with a recommended answer, until you share a design concept |
| `/madmattskills prd` | Writes the destination doc: user stories, module map, testing decisions, out of scope |
| `/madmattskills issues` | Splits the PRD into tracer-bullet vertical slices with `Blocked by` (a kanban DAG) |
| `/madmattskills afk` | Implements one AFK issue with red-green-refactor and feedback loops, commits, stops |
| `/madmattskills architecture` | Finds shallow-module clusters to deepen so the codebase is easier to test |
| `/madmattskills review` | Fresh-context review with coding standards pushed in alongside the diff |

## AFK loop scripts

`skills/madmattskills/scripts/` holds `ralph-once.sh` (a single iteration you
watch), `ralph-afk.sh [max]` (loops until `NO MORE TASKS`), and
`ralph-prompt.md`. Copy them into a project and tune them. Run the AFK loop in
a sandbox (container or throwaway worktree): it accepts edits without asking.

## Layout

```
.claude-plugin/        marketplace.json + plugin.json
skills/madmattskills/
  SKILL.md             core rules + mode router (always loaded when triggered)
  references/          per-mode instructions (loaded on demand)
  templates/           PRD and issue templates
  scripts/             Ralph loop scripts
install.sh             personal install
```

These are plain markdown and shell. Own the stack: edit them to suit how you work.
