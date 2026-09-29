#!/usr/bin/env bash
# AFK loop: one fresh session per issue until no AFK tasks remain.
# Run inside a sandbox (container, devcontainer or throwaway worktree).
# Usage: ralph-afk.sh [max_iterations] [issues_dir]
set -euo pipefail

MAX="${1:-10}"
ISSUES_DIR="${2:-issues}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROMPT_FILE="${RALPH_PROMPT:-$SCRIPT_DIR/ralph-prompt.md}"

for ((i = 1; i <= MAX; i++)); do
  echo "=== Ralph iteration $i/$MAX ==="
  issues="$(for f in "$ISSUES_DIR"/*.md; do [ -e "$f" ] && printf '\n===== %s =====\n' "$f" && cat "$f"; done)"
  commits="$(git log -n 5 --format='%h %s%n%b' 2>/dev/null || true)"

  output="$(claude -p --permission-mode acceptEdits "ISSUES:
$issues

RECENT COMMITS:
$commits

$(cat "$PROMPT_FILE")" | tee /dev/stderr)"

  if grep -q '<promise>NO MORE TASKS</promise>' <<<"$output"; then
    echo "=== No more AFK tasks after $i iteration(s) ==="
    exit 0
  fi
done

echo "=== Reached max iterations ($MAX) ==="
