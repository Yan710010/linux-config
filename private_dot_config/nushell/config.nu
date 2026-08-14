# config.nu
# vim:ft=nu
#
# Installed by:
# version = "0.114.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R

# 禁用提示
$env.config.show_banner = false

# 使用vi按键模式
# 不使用vi按键模式
# 那到底用不用
# (nushell似乎不支持用starship更新$character)
#$env.config.edit_mode = 'vi'

# 不能动态source还是有点坏
^zoxide init nushell --cmd c
| save -f ( $nu.user-autoload-dirs | first | path join 'zoxide.init.nu' )
^starship init nu
| save -f ( $nu.user-autoload-dirs | first | path join 'starship.init.nu' )

$env.GPG_TTY = (^tty)

# 导入 ~/.local/share/nushell/completions/ 中的补全
# 但是这玩意怎么能卡我100ms
# use completions.nu *
