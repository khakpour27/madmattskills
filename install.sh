#!/usr/bin/env bash
# Install madmattskills as a personal (user-level) Claude Code skill, available
# in every project as /madmattskills.
#
#   ./install.sh            symlink (git pull here updates it everywhere)
#   ./install.sh --copy     copy instead of symlink
#   curl -fsSL https://raw.githubusercontent.com/khakpour27/madmattskills/main/install.sh | bash
set -euo pipefail

REPO_URL="https://github.com/khakpour27/madmattskills.git"
SKILLS_DIR="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
TARGET="$SKILLS_DIR/madmattskills"
MODE="link"
[ "${1:-}" = "--copy" ] && MODE="copy"

SRC_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd || true)"
if [ -z "$SRC_ROOT" ] || [ ! -f "$SRC_ROOT/skills/madmattskills/SKILL.md" ]; then
  # Running via curl | bash: clone to a stable location first.
  SRC_ROOT="${MADMATTSKILLS_HOME:-$HOME/.local/share/madmattskills}"
  if [ -d "$SRC_ROOT/.git" ]; then
    git -C "$SRC_ROOT" pull --ff-only
  else
    git clone --depth 1 "$REPO_URL" "$SRC_ROOT"
  fi
fi

mkdir -p "$SKILLS_DIR"
rm -rf "$TARGET"
if [ "$MODE" = "copy" ]; then
  cp -R "$SRC_ROOT/skills/madmattskills" "$TARGET"
else
  ln -s "$SRC_ROOT/skills/madmattskills" "$TARGET"
fi
echo "Installed madmattskills -> $TARGET ($MODE). Use /madmattskills in any project."
