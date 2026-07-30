-- 定义开机自动启动的软件

hl.on("hyprland.start", function()
    -- Logi 键盘的第三方linux驱动
    hl.exec_cmd("solaar --window hide")

    -- 视奸提醒
    hl.exec_cmd("pgrep ssh-notifier || ssh-notifier")
    -- 屏幕使用时间记录……？
    hl.exec_cmd("hyprscreentime daemon")

    hl.exec_cmd("wezterm", { workspace = 1 })
    hl.exec_cmd("zen-browser", { workspace = "2 silent" })
    --hl.exec_cmd("qq", { workspace = "3 silent", float = true })
    hl.exec_cmd("Telegram", { workspace = "3 silent" })

    -- 常驻悬浮终端
    hl.exec_cmd("wezterm", { workspace = "special:arcaea silent", pseudo = true })
end)
