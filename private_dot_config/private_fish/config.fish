set -gx GPG_TTY (tty)

# 如果是在tty1登录则启动Hyprland
if test "$(tty)" = "/dev/tty1"
    Hyprland
end
