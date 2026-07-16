local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.term = "wezterm"

config.cursor_thickness = 2
config.font_size = 11

-- config.front_end = "WebGpu"

config.font = wezterm.font_with_fallback {
    { family = "monospace", weight = 500},
}
config.font_rules = {
    {
        intensity = "Bold",
        font = wezterm.font("monospace", { weight = 800 }),
    }
}
-- -->  >= != 连字测试 </>  <== ========>=<========= -------->-<--------
-- 显式设置连字启用情况
--config.harfbuzz_features = {'calt', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'ss09', 'liga'}
-- (Maple Mono 默认就挺好的了)

config.color_scheme = 'nightfox'
config.colors = { scrollbar_thumb = '404040a0' }

-- 定义窗口透明度
local OPACITY = 0.80
config.window_background_opacity = OPACITY
config.text_background_opacity = OPACITY

-- 设置窗口边框
config.window_padding = {
  left = 5,
  right = 5,
  top = 2,
  bottom = 2,
}

-- 在只有一个标签页时隐藏标签栏
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- 启用滚动条
config.enable_scroll_bar = true

local act = wezterm.action
config.keys = {
    { key = 'UpArrow', mods = 'SHIFT', action = act.ScrollByLine(-1) },
    { key = 'DownArrow', mods = 'SHIFT', action = act.ScrollByLine(1) },

    { key = "B", mods = "CTRL|SHIFT", action = act.EmitEvent('disable-opacity')},
    { key = "T", mods = "CTRL|SHIFT", action = act.EmitEvent('toggle-transparent')},
}
config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = { WheelUp = 1 } } },
    mods = 'NONE',
    action = act.ScrollByLine(-5),
  },
  {
    event = { Down = { streak = 1, button = { WheelDown = 1 } } },
    mods = 'NONE',
    action = act.ScrollByLine(5),
  },
}

-- 事件
wezterm.on('disable-opacity', function(window, pane)
    -- 获取当前配置覆盖(如果没有就生成一个空表)
    local overrides = window:get_config_overrides() or {}
    -- 检查当前透明度覆盖情况
    if overrides.window_background_opacity ~= 1 then
        overrides.window_background_opacity = 1
    else
        overrides.window_background_opacity = OPACITY
    end
    -- 应用新的透明度
    window:set_config_overrides(overrides)
end)
wezterm.on('toggle-transparent', function(window, pane)
    -- 获取当前配置覆盖(如果没有就生成一个空表)
    local overrides = window:get_config_overrides() or {}
    -- 检查当前透明度覆盖情况
    if overrides.window_background_opacity ~= 0.2 then
        overrides.window_background_opacity = 0.2
    else
        overrides.window_background_opacity = OPACITY
    end
    -- 应用新的透明度
    window:set_config_overrides(overrides)
end)

return config
