# dotfiles

Personal config: neovim, zsh and ghostty. macOS-primary, Linux (Arch/Hyprland) fallback.

## Install

Requires `stow` and `git`.

```sh
git clone <this repo> ~/.dotfiles
cd ~/.dotfiles
stow --restow -v --no-folding --dotfiles -t ~ -d ~/.dotfiles .

# after first install
stow-dot
```

- `--dotfiles`: `dot-zshrc` -> `~/.zshrc`.
- `--no-folding`: link files, not whole dirs; keep runtime state out.

## Software in use

Human inventory from these dotfiles, `agents/skills` prose, and current
Homebrew state. Not every item is required on every host; transitive Homebrew
libraries are omitted.

- Core: `zsh`, `bash`, `git`, `stow`, `curl`, `brew`, `flatpak`
- Shell: `starship`, `zoxide`, `direnv`, `fzf`, `zsh-autosuggestions`,
  `zsh-history-substring-search`, `zsh-syntax-highlighting`
- CLI replacements/viewers: `bat`, `eza`, `erdtree`, `ripgrep`, `fd`,
  `git-delta`, `difftastic`, `dust`, `duf`, `btop`, `bottom`, `viddy`,
  `glow`, `tealdeer`, `tree`
- Data/docs: `duckdb`, `jq`, `yq`, `qsv`, `visidata`, `chafa`, `poppler`,
  `zathura`, `Foliate`
- Editors/terminal: `neovim`, `vim`, `ptpython`, `ghostty`
- Dev tools: `uv`, `prek`, `shellcheck`, `sqlfluff`, `typos-cli`,
  `tree-sitter-cli`, `ast-grep`, `sd`, `semgrep`, `tokei`, `hyperfine`,
  `just`
- Languages/runtimes: `go`, `node@22`, `pnpm`, `rust`, `lua`, `luarocks`,
  `python@3.13`, `python@3.14`, `ruby`
- Containers/infra: `docker`, `docker-buildx`, `docker-compose`, `colima`,
  `lazydocker`, `kubernetes-cli`, `k9s`, `helm`, `argocd`, `astro`,
  `awscli`
- Git tools: `gh`, `lazygit`, `git-cliff`, `git-filter-repo`
- Agent skill guidance: `pre-commit`, `shfmt`, `ruff`, `mypy`, `pyright`, `ty`,
  `pytest`, `pytest-cov`, `pip-audit`, `deptry`, `vulture`, `pydantic`,
  `typer`, `rich`, `click`, `golangci-lint`, `govulncheck`, `gofumpt`, `cobra`,
  `viper`, `pflag`, `bubbletea`, `bubbles`, `lipgloss`, `huh`, `gum`, `pgx`,
  `modernc.org/sqlite`, `testify`, `go-cmp`, `goldie`
- Linux desktop: `hyprland`, `hyprctl`, `hyprpaper`, `hyprsunset`, `waybar`,
  `mako`, `wofi`, `yazi`, `dolphin`, `nm-applet`, `wireplumber`, `wpctl`,
  `brightnessctl`, `playerctl`, `grim`, `slurp`, `cliphist`, `wl-copy`,
  `wl-paste`
- Apps/media: `firefox`, `newsraft`, `mpv`, `feh`, `sxiv`, `surfraw`,
  `yt-dlp`, `ollama`, `opencode`
- Local casks: `1password-cli`, `basictex`, `claude`, `claude-code`,
  `ghostty`, `maccy`, `miniconda`, `windows-app`
- Other requested Brew formulae: `automake`, `buf`, `ctags`, `gping`, `libpq`,
  `libtool`, `lnav`, `make`, `pixi`, `pup`, `rtk`, `rumdl`, `sevenzip`,
  `socat`, `spark`, `wget`, `youplot`, `zip`

## Layout

- `dot-config/` -> `~/.config/`: `nvim`, `zsh`, `ghostty`, `newsraft`
- `dot-local/bin/` -> `~/.local/bin/`: scripts
- `dot-vim/` -> `~/.vim/`: rescue vim config
- `dot-bashrc` -> `~/.bashrc`: rescue shell fallback
- `dot-gitconfig` -> `~/.gitconfig`
- `dot-zshenv` -> `~/.zshenv`: sets `ZDOTDIR=~/.config/zsh`
- `dot-ssh/` -> `~/.ssh/`: empty placeholder
- `agents/`: agent rules and local skills

## Local overrides

`~/.config/zsh/local` is gitignored and sourced first. Put machine-only state
there:

- PATH prepends for machine-only tools
- corporate certs (`SSL_CERT_FILE`, `CURL_CA_BUNDLE`)
- secrets

Never commit this file.

## Stow ignores

`.stow-local-ignore` excludes:

- `README.md`
- `.stow-local-ignore` itself

Stow already ignores `.git/` and `.gitignore`.
