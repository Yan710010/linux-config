hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("HYPRCURSOR_SIZE", "24")

hl.env("LANG", "zh_CN.UTF-8")
hl.env("LANGUAGE", "zh_CN")

hl.env("AQ_DRM_DEVICES", "/dev/dri/card1:/dev/dri/card0")
hl.env("VK_ICD_FILENAMES", "/usr/share/vulkan/icd.d/intel_icd.json")

hl.env("TERMINAL", Terminal)


hl.on("hyprland.start", function()
    hl.exec_cmd('dbus-update-activation-environment --systemd --all')
    hl.exec_cmd("systemctl --user start hyprland-session-custom.target")
end)

hl.on("hyprland.shutdown", function()
    os.execute("systemctl --user stop hyprland-session-custom.target && sleep 0.1")
end)
