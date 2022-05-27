#!/usr/bin/env bash
echo
echo "INSTALLING SOFTWARE"
echo

PKGS=(
	"anki"
	"brave-bin"
	"choose-rust-git"
	"hackernews_tui"
	"keyd-git"
	"megasync-bin"
	"nnn-nerd"
	"nyxt"
	"picom-ibhagwan-git"
	"rofi"
	"rofi-power-menu"
	"so-git"
	# "urxvt-font-size-git"
	"yank"
	# fonts
	"nerd-fonts-hack"
	"nerd-fonts-noto"
	"otf-nerd-fonts-fira-code"
	"ttf-iosevka-nerd"
	"ttf-opendyslexic"
)

for PKG in "${PKGS[@]}"; do
	echo "INSTALLING: ${PKG}"
	yay -S "$PKG" --noconfirm --needed
done
