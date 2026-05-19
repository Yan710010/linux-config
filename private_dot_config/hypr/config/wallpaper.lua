-- 你说得对但是 hyprpaper 是一款后面忘了
hl.on("hyprland.start", function()
    -- hl.exec_cmd("hyprpaper")
    hl.exec_cmd("awww-daemon")
end)

-- 指定壁纸文件夹
local wp_home = "~/Pictures/wallpapers"
local wp_list = {}
local wp_ptr = 1

-- awww 的壁纸切换参数
local awww_opt = "--transition-type wipe --transition-fps 60 --transition-angle 30 --transition-duration 2"

-- 轮选壁纸
local function next_wallpaper()
    if wp_ptr + 1 >= #wp_list then
        local handle = io.popen("ls " .. wp_home .. " | shuf")
        local new_wp_list = {}
        if handle then
            for file in handle:lines() do
                table.insert(new_wp_list, file)
            end
        end
        -- 如果第一张与最后一张相同则删去
        if new_wp_list[1] == wp_list[#wp_list] then
            table.remove(new_wp_list, 1)
        end
        wp_list = new_wp_list
        wp_ptr = 1
    else
        wp_ptr = wp_ptr + 1
    end
    return wp_list[wp_ptr]
end

local function switch_wallpaper()
    local next = next_wallpaper()
    if next then
        hl.exec_cmd("awww img " .. awww_opt .. " " .. wp_home .. '/' .. next)
        local w = hl.get_active_window()
        if not w or w.fullscreen == 0 then
            hl.notification.create { text = next, duration = 3000, color = "rgb(f5a9b8)" }
        end
    end
end

-- 定时切换
local timer = hl.timer(switch_wallpaper, { timeout = 600 * 1000, type = "repeat" })

-- 手动切换
hl.bind("SUPER + G", function()
    switch_wallpaper()
    timer:set_enabled(true) -- 重置计时器
end)
