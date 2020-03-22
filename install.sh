stow -R --dotfiles git
stow -R --dotfiles i3wm
stow -R --dotfiles newsboat
stow -R --dotfiles nvim
stow -R --dotfiles picom
stow -R --dotfiles ranger
stow -R --dotfiles sxhkd
stow -R --dotfiles xorg
stow -R --dotfiles zsh

pacman -Qe > info/pacman.txt
tree -a > info/tree.txt
