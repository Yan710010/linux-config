-- 定义滚动平铺相关的配置以及按键

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
        column_width = 0.8,
        focus_fit_method = 0,
        follow_min_visible = 0.4,
        explicit_column_widths = "0.1, 0.2, 0.33, 0.4, 0.5, 0.67, 0.8, 1.0"
    },
})

hl.define_submap("workspace", function()
    hl.bind("SHIFT + H", hl.dsp.window.move { direction = "left" })
    hl.bind("SHIFT + L", hl.dsp.window.move { direction = "right" })
    hl.bind("SHIFT + J", hl.dsp.window.move { direction = "down" })
    hl.bind("SHIFT + K", hl.dsp.window.move { direction = "up" })

    hl.bind("minus", hl.dsp.layout("colresize -conf"))
    hl.bind("equal", hl.dsp.layout("colresize +conf"))

    hl.bind("comma", hl.dsp.layout("move -col"), { repeating = true })
    hl.bind("period", hl.dsp.layout("move +col"), { repeating = true })

    hl.bind("space", function()
        if hl.get_config("scrolling.focus_fit_method") == 1 then
            hl.notification.create { text = "Change fit method to CENTER", timeout = 800, color = "#1f1e33" }
            hl.config { scrolling = { focus_fit_method = 0 } }
        else
            hl.notification.create { text = "Change fit method to FIT", timeout = 800, color = "#1f1e33" }
            hl.config { scrolling = { focus_fit_method = 1 } }
        end
    end, { ignore_mods = true })
end)

hl.bind("SUPER + minus", hl.dsp.layout("colresize -conf"), { repeating = true })
hl.bind("SUPER + equal", hl.dsp.layout("colresize +conf"), { repeating = true })
