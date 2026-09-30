hl.window_rule({
    name = "Fcitx5 Input Window Blur Fix",
    match = { title = "Fcitx5 Input Window" },
    no_blur = 1,
})
hl.window_rule({
    name = "Terminal No Blur",
    match = { class = "(kitty|org.wezfurlong.wezterm)" },
    no_blur = 1,
})
hl.window_rule({
    name = "QQ Transparent",
    match = { class = "QQ", title = "negative:(图片查看器|视频播放器)" },
    opacity = 0.9,
})

hl.window_rule {
    name = "osu! pointer lock",
    match = { class = "osu!" },
    confine_pointer = true,
}
hl.window_rule {
    name = "Minecraft pointer lock",
    match = { class = "Minecraft\\*" },
    confine_pointer = true,
}
