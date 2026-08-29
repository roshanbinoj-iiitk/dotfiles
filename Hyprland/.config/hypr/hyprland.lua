------------------------------------------------------
-- Hyprland Lua Configuration
-- Migrated to Hyprland 0.56+ / 0.57 Lua Format
------------------------------------------------------

------------------
---- MONITORS ----
------------------

hl.monitor({
    output = "",
    mode = "highrr",
    position = "auto",
    scale = 1,
})

-- hl.monitor({
--     output = "eDP-1",
--     mode = "1920x1080@60.00500",
--     position = "auto",
--     scale = 1,
-- })

-- hl.monitor({
--     output = "HDMI-A-1",
--     mode = "1920x1080@60.00500",
--     position = "auto",
--     scale = 1,
--     mirror = "eDP-1",
-- })


---------------------
---- WORKSPACES -----
---------------------

for i = 1, 5 do
    hl.workspace_rule({ workspace = tostring(i), monitor = "eDP-1", default = true })
end

for i = 6, 10 do
    hl.workspace_rule({ workspace = tostring(i), monitor = "HDMI-A-1", default = true })
end

-------------------------------
---- LOAD MODULAR CONFIGS -----
-------------------------------

require("confs.envs")
require("confs.autostarts")
require("confs.looks")
require("confs.layerrules")
require("confs.input")
require("confs.binds")
require("confs.windowrules")
require("confs.plugins")
require("confs.env_var_nvidia")

------------------------------
---- GLOBAL SESSION HOOKS ----
------------------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("sudo pkill -x mpv")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user start hyprland-session.target")
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 24")
end)

hl.on("hyprland.shutdown", function()
    hl.exec_cmd("systemctl --user stop hyprland-session.target && sleep 0.1")
end)

-- Sleep on lid close
hl.bind("switch:Lid Switch", hl.dsp.exec_cmd("systemctl suspend"), { locked = true })
