----------------------
---- WINDOW RULES ----
----------------------

hl.window_rule({ name = "windowrule-1", match = { title = "^(Waypaper)$" }, float = true })
hl.window_rule({ name = "windowrule-2", match = { title = "^(overskride)$" }, float = true })
hl.window_rule({ name = "windowrule-3", match = { title = "^(Volume Control)$" }, float = true })
hl.window_rule({ name = "windowrule-4", match = { title = "^(Network Connections)$" }, float = true })
hl.window_rule({ name = "windowrule-5", match = { title = "^(Blender Render)$" }, float = true })
hl.window_rule({ name = "windowrule-6", match = { title = "^(fastfetch)$" }, float = true })
hl.window_rule({ name = "windowrule-7", match = { title = "^(Bluetooth Devices)$" }, float = true })
hl.window_rule({ name = "windowrule-8", match = { title = "^(nmtui)$" }, float = true })
hl.window_rule({ name = "windowrule-9", match = { class = "^(blender)$", title = "^(Blender)$" }, float = true })
hl.window_rule({ name = "windowrule-10", match = { title = "^(galculator)$" }, float = true })
hl.window_rule({ name = "windowrule-11", match = { title = "^(Choose directory for export file)$" }, float = true })
hl.window_rule({ name = "windowrule-12", match = { class = "^$", title = "^$" }, no_blur = true })
hl.window_rule({ name = "windowrule-13", match = { class = ".*" }, suppress_event = "maximize" })
hl.window_rule({ name = "windowrule-14", match = { class = "^(Thunar)$" }, opacity = "0.8 0.8" })
hl.window_rule({ name = "windowrule-15", match = { class = "^(Thunar)$", title = "^(Rename .*)$" }, float = true })
hl.window_rule({ name = "windowrule-16", match = { class = "^(thunar)$" }, opacity = "0.8 0.8" })
hl.window_rule({ name = "windowrule-17", match = { class = "^(thunar)$", title = "^(Rename .*)$" }, float = true })
hl.window_rule({ name = "windowrule-18", match = { title = "^(File Operation Progress)$" }, float = true })
hl.window_rule({ name = "windowrule-19", match = { class = "^(vlc)$" }, no_blur = true })
hl.window_rule({ name = "windowrule-20", match = { class = "^(vlc)$", title = "\\w*$" }, no_initial_focus = true, suppress_event = "activate" })
hl.window_rule({ name = "windowrule-21", match = { class = "^(ONLYOFFICE)$" }, no_blur = true })
hl.window_rule({ name = "windowrule-22", match = { class = "^(kitty)$" }, xray = true })
hl.window_rule({ name = "windowrule-23", match = { class = "^(Spotify)$" }, opacity = "0.8 0.8", xray = true, workspace = "special:Music" })
hl.window_rule({ name = "windowrule-24", match = { class = "^(UnrealEditor)$", title = "\\w*$" }, no_initial_focus = true, suppress_event = "activate" })
hl.window_rule({ name = "windowrule-25", match = { class = "^(resolve)$", title = "\\w*$" }, no_initial_focus = true, suppress_event = "activate" })
hl.window_rule({ name = "windowrule-26", match = { class = "^(jetbrains-studio)$", title = "\\w*$" }, no_initial_focus = true, suppress_event = "activate" })
hl.window_rule({ name = "windowrule-27", match = { class = "^(Ardour.*)$" }, no_initial_focus = true, suppress_event = "activate" })
hl.window_rule({ name = "windowrule-28", match = { title = "^(WhatsApp Web)$" }, group = "set always", workspace = "special:Chats" })
hl.window_rule({ name = "windowrule-29", match = { class = "^(vesktop)$" }, xray = true, workspace = "special:Chats", group = "set always" })
hl.window_rule({ name = "windowrule-30", match = { class = "^(com\\.stremio\\.stremio)$" }, workspace = "special:Streams" })
hl.window_rule({
    name = "windowrule-31",
    match = { title = "^(Picture-in-Picture)$" },
    float = true,
    pin = true,
    no_initial_focus = true,
    size = { "(monitor_w*0.35)", "(monitor_h*0.35)" },
    move = { "((monitor_w*1)-window_w-5)", "((monitor_h*1)-window_h-5)" },
})
hl.window_rule({ name = "windowrule-32", match = { class = "^(obsidian)$" }, opacity = "0.8 0.8" })
hl.window_rule({ name = "windowrule-33", match = { class = "^(heroic)$" }, opacity = "0.8 0.8" })
hl.window_rule({ name = "windowrule-34", match = { class = "^(vesktop)$" }, opacity = "0.8 0.8", xray = true })
hl.window_rule({
    name = "windowrule-35",
    match = { class = "^(com\\.gabm\\.satty)$", title = "^(satty)$" },
    float = true,
    size = { "(monitor_w*0.9)", "(monitor_h*0.9)" },
    move = { "((monitor_w - window_w) / 2)", "((monitor_h - window_h) / 2)" },
})
