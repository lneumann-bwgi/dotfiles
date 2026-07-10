# dotfiles

Personal config. Neovim + zsh + ghostty. macOS-primary, Linux (Arch/Hyprland)
fallback.

## Install

Requires `stow` and `git`.

```sh
git clone <this repo> ~/.dotfiles
cd ~/.dotfiles
stow --restow -v --no-folding --dotfiles -t ~ -d ~/.dotfiles .
# or the alias defined in .config/zsh/aliases:
stow-dot
```

`--dotfiles` renames `dot-*` in the repo to `.*` in `$HOME`
(`dot-zshrc` → `~/.zshrc`). `--no-folding` symlinks individual files instead
of whole directories, so runtime state (e.g. `~/.config/zsh/.zsh_history`)
does not leak into the repo.

## Runtime deps

Not all required, but many aliases/functions assume them.

- Core: `zsh`, `git`, `stow`, `curl`
- Shell tooling: `starship`, `zoxide`, `direnv`, `fzf`, `fd`, `ripgrep`, `bat`,
  `eza`, `delta`, `dust`, `duf`, `btop`, `btm`, `viddy`, `erd`
- Editors: `neovim` (main), plain `vim` (fallback rescue only)
- Terminal: `ghostty`
- Python: `uv` (aliases use `uvx` for one-shot invocations)
- Linux-only: `hyprland`, `waybar`, `mako`, `wofi`, `yazi`

## Layout

- `.config/`       XDG-based configs (`nvim`, `zsh`, `ghostty`, `newsraft`, …)
- `.local/bin/`    scripts on `$PATH`
- `.vim/`         legacy vim config, kept for rescue on machines without nvim
- `dot-bashrc`    → `~/.bashrc` (rescue fallback)
- `dot-gitconfig` → `~/.gitconfig`
- `dot-zshenv`    → `~/.zshenv` (loads `ZDOTDIR=~/.config/zsh`)
- `dot-ssh/`      → `~/.ssh/` (not currently populated)

## Machine-specific overrides

`.config/zsh/local` (gitignored) — sourced first by `dot-zshrc`. Put:

- PATH prepends for machine-only tools
- Corporate certs (`SSL_CERT_FILE`, `CURL_CA_BUNDLE`, …)
- Secrets (1Password Connect token, cloud API tokens)
- Work-only aliases

Never commit this file.

## Files not stowed

Excluded via `.stow-local-ignore`:

- `README.md`
- `.stow-local-ignore` itself

Git-related paths (`.git/`, `.gitignore`) are excluded by stow's built-in
defaults.
