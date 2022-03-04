export NNN_OPTS="dxa"
export NNN_OPENER=~/.config/nnn/plugins/nuke
export NNN_PLUG='p:preview-tabbed;P:preview-tui;j:autojump;f:fzcd;F:fixname;h:fzhist;o:fzopen;r:gitroot;v:imgview;x:!chmod +x $nnn'
export NNN_BMS='d:~/Documents;D:~/Downloads/;m:~/MEGA;d:~/.dotfiles'
export NNN_COLORS="2136"
export NNN_TRASH=1
export NNN_FIFO=/tmp/nnn.fifo

if [ -f /usr/share/nnn/quitcd/quitcd.bash_zsh ]; then
    source /usr/share/nnn/quitcd/quitcd.bash_zsh
fi

alias ncp="cat ${NNN_SEL:-${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.selection} | tr '\0' '\n'"
