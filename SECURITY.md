# Security Policy

## Reporting a vulnerability

Please do not open a public issue. Use GitHub's private reporting instead:
**Security → Report a vulnerability** on
[this repository](https://github.com/khakpour27/madmattskills/security).

## Scope

madmattskills is markdown instructions plus small bash scripts. Relevant
issues include:

- prompts or scripts that could make an agent leak secrets or run
  unintended commands
- installer behaviour that could delete or overwrite user files
- prompt-injection paths through issue files fed to the AFK loop

## Safe use

- Run `ralph-afk.sh` only in a sandbox without production credentials.
- Only feed it issues written by people you trust.
- Read `install.sh` before running it.
