# Contributing to madmattskills

Thanks for helping. This project is plain markdown and bash, so it's easy to
change.

## Ground rules

- **Keep `SKILL.md` small.** It loads every time the skill triggers. Put
  mode-specific detail in `skills/madmattskills/references/`.
- **One mode, one reference file.** A new mode needs a row in the `SKILL.md`
  table, a `references/<mode>.md`, and a row in the README usage table.
- **Changes must come from use.** Describe the failure you saw (for example,
  "the issues mode kept proposing a schema-only first slice") and how your
  change fixes it.
- **Scripts must stay portable bash.** Run `bash -n` on anything you touch.

## Before you open a PR

```bash
claude plugin validate .            # manifests are valid
bash -n install.sh skills/madmattskills/scripts/*.sh
```

Then try your change on a real repo with `./install.sh` and describe what you
saw in the PR.

## Credit

Add yourself to [CONTRIBUTORS.md](CONTRIBUTORS.md) in your PR.
