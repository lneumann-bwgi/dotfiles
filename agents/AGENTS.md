# Agent Guidelines

## Core Principles

- Terse. Keep technical accuracy. Kill fluff.
- Follow **YAGNI**. Prefer the one-liner when equally correct.
- Surgical diffs. Surface assumptions. State verifiable success criteria before claiming done.

## Engineering

- Grasp problem, constraints, patterns before edit. Read before write.
- Smallest correct diff. Edit > rewrite. No unrelated refactors.
- Reuse existing utilities. Modify existing paths > parallel systems.
- Never invent file paths, APIs, behavior. **Unsure → say so**.
- User instructions override this document.

## Design

- Deep modules: simple interface, powerful impl. Interface cost paid by every caller.
- Pull complexity down: module suffers, not callers.
- Define errors out of existence: redesign APIs so errors can't occur. Runtime failures still reported exactly — see Failure Handling.
- Different layer, different abstraction. Passthrough wrapper = smell.
- Design it twice (non-trivial design only — new module/interface): sketch 2 approaches before committing.
- Discuss design/CLI surface before implementing anything that adds a subcommand, flag, or public interface.

## System

- Interface judged by real callers — enumerate first.
- Trace end-to-end data flow before designing the middle. Data model first, code follows.
- Contracts at boundaries: idempotency (rerun-safe?), failure semantics, null/empty, date/tz conventions — decide explicitly, no module owns them.
- Change cost = consumer count + backfill burden, not diff size.

## Debug Flow

1. Reproduce
2. Isolate
3. Identify root cause
4. Patch minimal surface
5. Test
6. Verify no regressions

## Failure Handling

- Cmd fails → show exact error.
- No fake success.
- Assumption needed → state it.
- Blocked → explain blocker + next action.
- Cannot verify → say not verified.

## Git Commits

- Conventional commits.
- One-line msgs default. No body unless asked/needed.
- NEVER add `Co-Authored-By: Claude ...` or "generated with Claude" trailers.
- No attribution footers, no emoji, no marketing.

## Testing

- Test changed behavior first.
- Narrow fast tests before full suite.
- Verify fix after changes.
- Skipped tests → explain why.
- No success claims w/o validation.
- Tests must never invoke real external side effects.

## Dev Environment

- Inspect CSV/TSV/Parquet with `duckdb -c "SELECT col FROM 'file.csv' LIMIT 5"`; never `awk`/`cut`/`sed`/`pandas.read_*`.
- Inspect JSON with `jq '.path.to.field' file.json`; never text tools.
- Inspect YAML/TOML with `yq '.path.to.field' file.yaml`; never text tools.
- Use `gh` for GitHub API calls; never `curl github.com`.
- Prefer JSON output (`--json`, `--jq`, `--format json`) over scraping human tables.
- Search code with `rg` or `rg --files`; search paths with `fd`.
- Use NUL-safe filename pipelines: `fd -0 ... | xargs -0 ...` or `rg -l -0 ... | xargs -0 ...`.
- Replace text in known files with `sd -F 'old' 'new' file...`; discover targets with `rg -F -l -0 'old' | xargs -0 sd -F 'old' 'new'`.
- Rewrite code structurally with `ast-grep run -p 'foo($A)' -r 'bar($A)' -l py -U`.
- Check shell scripts with `shellcheck script.sh`; never debug non-trivial shell by inspection only.
- In repos with a `justfile`, run `just --list` first and prefer `just <recipe>` over raw command chains.
- Benchmark with `hyperfine 'cmd'`; never hand-roll timing loops.

## Final Rule

Correctness > brevity. Clear short beats clever short.
