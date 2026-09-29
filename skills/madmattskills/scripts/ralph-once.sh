#!/usr/bin/env bash
# One AFK iteration with a human watching. Run from the target repo root.
# Usage: ralph-once.sh [issues_dir]
set -euo pipefail

ISSUES_DIR="${1:-issues}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROMPT_FILE="${RALPH_PROMPT:-$SCRIPT_DIR/ralph-prompt.md}"

issues="$(for f in "$ISSUES_DIR"/*.md; do [ -e "$f" ] && printf '\n===== %s =====\n' "$f" && cat "$f"; done)"
commits="$(git log -n 5 --format='%h %s%n%b' 2>/dev/null || true)"

claude --permission-mode acceptEdits "ISSUES:
$issues

RECENT COMMITS:
$commits

$(cat "$PROMPT_FILE")"
