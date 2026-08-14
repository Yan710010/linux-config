$env.config.abbreviations = {
  ...$env.config.abbreviations
  ta: 'tmux new -As'
  tl: 'tmux list-sessions'
  nmc: 'nmcli connection'
  p: '^power-state'
  u: '^update-system'
  sp: 'systemctl suspend'
  'vi': 'nvim'
  'vim': 'nvim'
}

alias plz = doas
alias eza = eza --icons auto --time-style "+%Y/%m/%d %H:%M:%S"

alias ll = ls -l
alias l = ll
alias la = ls -la
