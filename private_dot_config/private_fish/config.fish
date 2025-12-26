set -gx GPG_TTY (tty)

# 如果是在tty1登录则启动Hyprland
if test "$(tty)" = "/dev/tty1"
    # 因为用了ly-dm了所以不用这个了
    # Hyprland
end
