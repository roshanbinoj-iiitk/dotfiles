---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

local terminal = "kitty"
local fileManager = "thunar"
local menu = "rofi -show drun"
local emoji = "rofimoji -a copy"
local browser = "firefox"
local altbrowser = "brave"
local otherBrowser = "flatpak run io.gitlab.librewolf-community"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + CTRL + ALT + SHIFT + M", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + ALT + Return", hl.dsp.exec_cmd(altbrowser))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + CTRL + SPACE", hl.dsp.exec_cmd(emoji))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("waypaper"))
hl.bind(mainMod .. " + CTRL + W", hl.dsp.exec_cmd("waypaper --random"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("sleep 0.5; hyprlock"))

hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("heroic"))
hl.bind(mainMod .. " + grave", hl.dsp.exec_cmd("qs ipc -c overview call overview toggle"))

-- Layout orientation
hl.bind(mainMod .. " + Y", hl.dsp.layout("orientationcycle left center right"))

hl.bind(mainMod .. " + PERIOD", hl.dsp.exec_cmd("emote"))
hl.bind("Menu", hl.dsp.exec_cmd("kitty btop"))
hl.bind("SHIFT + Menu", hl.dsp.exec_cmd("kitty nvtop"))

-- Move focus with mainMod + hjkl keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move focused window with mainMod + SHIFT + hjkl keys
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up", group_aware = true }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down", group_aware = true }))

-- Workspaces 1-10
for i = 1, 10 do
    local key = tostring(i % 10)
    local ws = tostring(i)
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = ws }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = ws }))
    hl.bind(mainMod .. " + SHIFT + ALT + " .. key, hl.dsp.window.move({ workspace = ws, follow = false }))
    hl.bind(mainMod .. " + CTRL + SHIFT + " .. key, hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/move_all_windows.sh " .. ws))
end

-- Cycle through workspaces
hl.bind("ALT + grave", hl.dsp.focus({ workspace = "r+1" }))
hl.bind("ALT + SHIFT + grave", hl.dsp.focus({ workspace = "r-1" }))
hl.bind(mainMod .. " + grave", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + grave", hl.dsp.focus({ workspace = "e-1" }))

-- Group management
hl.bind(mainMod .. " + ALT + T", hl.dsp.group.toggle())
hl.bind(mainMod .. " + Tab", hl.dsp.group.next())
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.group.prev())
hl.bind(mainMod .. " + ALT + L", hl.dsp.group.lock({ action = "toggle" }))

-- Toggle float for all windows in workspace
hl.bind(mainMod .. " + ALT + V", function()
    local ws = hl.get_active_workspace()
    if ws then
        for _, win in ipairs(hl.get_workspace_windows(ws.id)) do
            hl.dispatch(hl.dsp.window.float({ action = "toggle", window = "address:" .. win.address }))
        end
    end
end)

-- Cycle next window and alter z-order
hl.bind("ALT + Tab", function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.alter_zorder({ mode = "top" }))
end)

-- Special workspaces
local special_workspaces = {
    { key = "M", name = "Music" },
    { key = "O", name = "Server" },
    { key = "U", name = "Browser" },
    { key = "I", name = "Chats" },
    { key = "P", name = "P" },
}

for _, spec in ipairs(special_workspaces) do
    hl.bind(mainMod .. " + " .. spec.key, hl.dsp.workspace.toggle_special(spec.name))
    hl.bind(mainMod .. " + SHIFT + " .. spec.key, hl.dsp.window.move({ workspace = "special:" .. spec.name }))
end

-- Mouse workspace scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse window dragging and resizing
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Brightness & Volume controls
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("swayosd-client --brightness raise"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("swayosd-client --brightness lower"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"), { locked = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("swayosd-client --output-volume raise"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("swayosd-client --output-volume lower"), { locked = true, repeating = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

-- Media navigation
hl.bind(mainMod .. " + CTRL + Right", hl.dsp.exec_cmd("playerctl next"))
hl.bind(mainMod .. " + CTRL + Left", hl.dsp.exec_cmd("playerctl previous"))

-- Looks toggle script
hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd(os.getenv("HOME") .. "/.config/hypr/scripts/togglelooks.sh"))

-- Waybar controls
hl.bind(mainMod .. " + ALT + W", hl.dsp.exec_cmd("waybar"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("killall -SIGUSR2 waybar"))

-- Fullscreen toggle
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd([[grim - | satty --filename - --output-filename ~/Pictures/Screenshots/screenshot-$(date '+%Y%m%d-%H:%M:%S').png --copy-command 'wl-copy']]))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd([[grim - | satty --fullscreen --filename - --output-filename ~/Pictures/Screenshots/screenshot-$(date '+%Y%m%d-%H:%M:%S').png --copy-command 'wl-copy']]))

-- OBS pass shortcut
hl.bind("SUPER + F10", hl.dsp.pass({ window = "class:^(com\\.obsproject\\.Studio)$" }))

-- Color picker
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mainMod .. " + ALT + C", hl.dsp.exec_cmd("hyprpicker -a -f rgb"))

-- Clipboard history
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("cliphist list | wofi --dmenu | cliphist decode | wl-copy"))

-- Directory search
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd(os.getenv("HOME") .. "/dotfiles/Scripts/wofi-dir-search.sh"))

-- Sway notification center
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
