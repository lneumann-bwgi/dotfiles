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

## Runtime deps

Not all required, but many aliases/functions assume them.

- Core: `zsh`, `git`, `stow`, `curl`
- Shell tooling: `starship`, `zoxide`, `direnv`, `fzf`, `fd`, `ripgrep`, `bat`,
  `eza`, `delta`, `dust`, `duf`, `btop`, `btm`, `viddy`, `erd`
- Editors: `neovim`, `vim` fallback
- Terminal: `ghostty`
- Python: `uv` / `uvx`
- Linux-only: `hyprland`, `waybar`, `mako`, `wofi`, `yazi`

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
