export NNN_OPTS="dxa"
export NNN_OPENER=~/.config/nnn/plugins/nuke
export NNN_COLORS="2136"
export NNN_TRASH=1

NNN_PLUG_PREVIEW='p:preview-tabbed;P:preview-tui'
NNN_PLUG_FZF='f:fzcd;h:fzhist;j:autojump;o:fzopen'
NNN_PLUG_MISC='d:dups;F:fixname;r:gitroot'
NNN_PLUG_SHELL='l:-!git log;s:-!git status;x:!chmod +x $nnn;X:!chmod -x $nnn'
export NNN_PLUG="$NNN_PLUG_PREVIEW;$NNN_PLUG_FZF;$NNN_PLUG_MISC;$NNN_PLUG_SHELL"

export NNN_BMS='d:~/Documents;D:~/Downloads/;m:~/MEGA;.:~/.dotfiles'

if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi

alias ncp="cat ${NNN_SEL:-${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.selection} | tr '\0' '\n'"
