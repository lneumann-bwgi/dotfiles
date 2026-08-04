# AGENTS.md

Canonical agent guidance shared across Claude Code, Codex, opencode.
Edit this file. Symlinks in `dot-claude/`, `dot-codex/`, `dot-config/opencode/`
propagate content to each tool's config dir on `stow`.

## Global rules

<!-- write shared rules here -->

## Per-machine override

Claude Code reads `@` imports. Add machine-local rules at:

    ~/.claude/CLAUDE.local.md

Codex / opencode: check tool docs for local-override mechanism; other tools
ignore the `@import` line below as plain text.

@~/.claude/CLAUDE.local.md
