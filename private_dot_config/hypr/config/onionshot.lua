hl.env("ONIONSHOT_DIR", "Pictures/ScreenShot/")

local shot = "onionshot --skip-depcheck -f -s clipboard-only -m "
hl.bind("PRINT", hl.dsp.exec_cmd(shot .. "fullscreen"))
hl.bind("SUPER + PRINT", hl.dsp.exec_cmd(shot .. "active-window"))
hl.bind("SUPER + SHIFT + PRINT", hl.dsp.exec_cmd(shot .. "region"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd(shot .. "region"))

-- 禁用截屏过程中的动画
hl.layer_rule({ match = { namespace = "(wayfreeze|selection)" }, no_anim = true, blur = false })
