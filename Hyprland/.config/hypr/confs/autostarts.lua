-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("hyprpm reload -n")
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd("waybar")

    -- Setting up cliphist
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    hl.exec_cmd("swaync")
    hl.exec_cmd("swayosd-server")
    hl.exec_cmd(os.getenv("HOME") .. "/dotfiles/Hyprland/.config/hypr/scripts/iiitkwifi.sh")
    hl.exec_cmd(os.getenv("HOME") .. "/dotfiles/Hyprland/.config/hypr/scripts/battery_shutdown.sh")

    hl.exec_cmd("nm-applet")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("qs -c overview")

    hl.exec_cmd("hypridle")
    hl.exec_cmd("gnome-keyring-daemon")
    hl.exec_cmd("gnome-keyring")

    hl.exec_cmd("input-remapper-control --command autoload")
end)
