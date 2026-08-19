# dotfiles

Personal config: `neovim`, `zsh`, `ghostty`. macOS-primary, Linux
(Arch/Hyprland) fallback.

## Install

Requires `stow` and `git`.

```sh
git clone <this repo> ~/.dotfiles
cd ~/.dotfiles
stow --restow -v --no-folding --dotfiles -t ~ -d ~/.dotfiles .
stow-dot   # subsequent runs
```

Flags:

- `--dotfiles` — `dot-zshrc` → `~/.zshrc`
- `--no-folding` — link files not dirs; keeps runtime state out of the repo

## Layout

| Path | Target | Notes |
| --- | --- | --- |
| `dot-config/` | `~/.config/` | `nvim`, `zsh`, `ghostty`, `newsraft` |
| `dot-local/bin/` | `~/.local/bin/` | user scripts |
| `dot-vim/` | `~/.vim/` | rescue vim config |
| `dot-bashrc` | `~/.bashrc` | rescue shell fallback |
| `dot-gitconfig` | `~/.gitconfig` | |
| `dot-zshenv` | `~/.zshenv` | sets `ZDOTDIR=~/.config/zsh` |
| `dot-ssh/` | `~/.ssh/` | placeholder |
| `agents/` | — | agent rules + local skills |

## Local overrides

`~/.config/zsh/local` is gitignored and sourced first. Put machine-only state
there — never commit it:

- `PATH` prepends for machine-only tools
- corporate certs (`SSL_CERT_FILE`, `CURL_CA_BUNDLE`)
- secrets

## Stow ignores

`.stow-local-ignore` excludes `README.md` and itself. Stow already ignores
`.git/` and `.gitignore`.

## Software

Inventory across hosts. Not every item is required on every host. Linux
provisioning lives in `~/.ansible`; macOS installs via Homebrew.

### Core

| Category | Packages |
| --- | --- |
| Shell | `zsh`, `bash`, `starship`, `zoxide`, `direnv`, `fzf`, `zsh-autosuggestions`, `zsh-history-substring-search`, `zsh-syntax-highlighting` |
| Editors/terminal | `neovim`, `vim`, `ptpython`, `ghostty` |
| Base | `git`, `stow`, `curl`, `wget`, `make`, `flatpak` |

### CLI

| Category | Packages |
| --- | --- |
| Replacements/viewers | `bat`, `eza`, `erdtree`, `ripgrep`, `fd`, `git-delta`, `difftastic`, `dust`, `duf`, `bottom`, `viddy`, `glow`, `tealdeer` |
| Data/docs | `duckdb`, `jq`, `yq`, `visidata`, `chafa`, `poppler`, `zathura`, `Foliate` |
| Utilities | `tokei`, `hyperfine`, `just`, `sd`, `ast-grep`, `tree-sitter-cli`, `typos`, `ctags`, `gping`, `socat`, `7zip`, `zip` |

### Dev

| Category | Packages |
| --- | --- |
| Languages | `go`, `rust`, `nodejs`, `pnpm`, `python`, `lua`, `luarocks`, `julia` |
| Python | `uv`, `ruff`, `prek` |
| Go tooling | `go-tools`, `gofumpt`, `golangci-lint`, `govulncheck` |
| Shell | `shellcheck`, `shfmt` |
| Git | `gh`, `lazygit`, `git-cliff` |
| Containers/infra | `docker`, `docker-buildx`, `docker-compose`, `lazydocker`, `kubectl`, `kubectx`, `k9s`, `argocd` |
| Build/libs | `libpq`, `base-devel` |

### Python tools (via `uv tool install`)

Current: `git-sim`, `radon`, `visidata`, `yt-dlp`, `ragwatcher`.

Extend as needed: `ruff`, `mypy`, `pyright`, `pre-commit`, `sqlfluff`.

### Linux desktop (Arch + Hyprland)

| Category | Packages |
| --- | --- |
| WM/compositor | `hyprland`, `hyprpaper`, `hyprsunset`, `waybar`, `mako`, `wofi` |
| Session | `network-manager-applet`, `wireplumber`, `brightnessctl`, `playerctl` |
| Screen/clipboard | `grim`, `slurp`, `cliphist`, `wl-clipboard` |
| File/image | `yazi`, `imv` |
| Apps/media | `firefox`, `newsraft`, `mpv`, `surfraw`, `yt-dlp`, `ollama` |
