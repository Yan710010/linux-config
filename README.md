# Yan的配置文件
此仓库包括了我所使用的数个软件的配置文件

<details>
<summary>部分软件列表</summary>

- [hyprland](./private_dot_config/hypr/)
- [wezterm](./private_dot_config/wezterm/)
- [fish](./private_dot_config/private_fish/)
- [starship](./private_dot_config/starship.toml) 终端提示符
- [waybar](./private_dot_config/waybar/)
- [wofi](./private_dot_config/wofi/)
- [yazi](./private_dot_config/yazi/) TUI文件管理器
- [zellij](./private_dot_config/zellij/)
- [swaync](./private_dot_config/swaync/) 消息提醒
- [.local/bin/](./dot_local/bin/) 一些神秘小脚本

</details>

## 应用配置文件
安装[chezmoi](https://www.chezmoi.io/), 然后运行
```sh
chezmoi init https://codeberg.org/Yan710010/linux-config
chezmoi apply
```
~~为什么选择chezmoi?我也不知道~~  
~~实际上一开始打算直接在$HOME下建立git仓库的但是观感并不好~~
