set -gx GPG_TTY (tty)

# 如果是在tty1登录则启动Hyprland
if test "$XDG_SESSION_TYPE" = "tty" && set -q XDG_VTNR && test $XDG_VTNR -eq 1 
    Hyprland
end
