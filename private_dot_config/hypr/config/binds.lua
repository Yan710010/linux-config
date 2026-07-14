-- 常用程序
local fileManager = "dolphin"
local webBroser = "zen-browser"
local mailManager = "thunderbird"

-- 程序启动器
local ignore_mods = { ignore_mods = true }

hl.bind("SUPER + R", hl.dsp.submap("run"))
hl.define_submap("run", "reset", function()
    hl.bind("D", hl.dsp.exec_cmd("wofi --show drun"), ignore_mods)
    hl.bind("R", hl.dsp.exec_cmd("wofi --show run"))
    hl.bind("ESCAPE", hl.dsp.submap("reset"), ignore_mods)

    hl.bind("E", hl.dsp.exec_cmd(fileManager), ignore_mods)
    hl.bind("B", hl.dsp.exec_cmd(webBroser), ignore_mods)
    hl.bind("T", hl.dsp.exec_cmd(mailManager), ignore_mods)

    hl.bind("O", function()
        hl.dispatch(hl.dsp.focus({ workspace = "name:osu!" }))
        hl.exec_cmd("notify-send -i osu-lazer -u low -e -t 2500 -a osu_launcher osu!启动!")
        hl.exec_cmd("gamemoderun nrun osu-lazer", { workspace = "name:osu! silent" })
    end)
end)

-- 剪贴板查看
hl.bind("SUPER + V",
    hl.dsp.exec_cmd("cliphist list | rofi -dmenu -p Clip -display-columns 2 | cliphist decode | wl-copy"))
-- 消息记录
hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t"))

-- 工作区切换
hl.bind("SUPER + W", hl.dsp.submap("workspace"))
hl.define_submap("workspace", "reset", function()
    hl.bind("ESCAPE", hl.dsp.submap("reset"), ignore_mods)
    hl.bind("W", hl.dsp.submap("reset"), ignore_mods)
    -- 指定的几个工作区
    hl.bind("D", hl.dsp.focus { workspace = "name:桌面" }, ignore_mods)
    hl.bind("O", hl.dsp.focus { workspace = "name:osu!" }, ignore_mods)
end)
hl.define_submap("workspace", function()
    hl.bind("H", hl.dsp.layout("focus l"))
    hl.bind("L", hl.dsp.layout("focus r"))
    hl.bind("J", hl.dsp.layout("focus d"))
    hl.bind("K", hl.dsp.layout("focus u"))

    hl.bind("Q", hl.dsp.focus { workspace = "e-1" }, ignore_mods)
    hl.bind("E", hl.dsp.focus { workspace = "e+1" }, ignore_mods)
end)

