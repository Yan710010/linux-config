# 实用指令
alias hx=helix
alias nv=nvim
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias tl='tmux list-sessions'
alias yay=paru
alias uh='export $(systemctl show-environment --user | rg HYPRLAND_INSTANCE_)'
alias disable-animation='hyprctl keyword animations:enabled no'
alias p=power-state
alias ls=lsd

alias sp='systemctl suspend'
alias spl='hyprlock > /dev/null &! ; systemctl suspend'

# 唉，习惯，唉
alias vi=nvim
alias vim=nvim

# 别名推断
alias doas='doas '
alias sudo='sudo '
# 你还怪礼貌的嘞
alias plz="doas " please="doas "

alias clear="clear -x"

# ...?
alias awa="timg ~/Pictures/好咲的/炫彩兽耳酱.gif"
