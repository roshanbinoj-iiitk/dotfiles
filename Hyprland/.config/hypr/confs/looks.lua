-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Fallback colors in case colors-hyprland is not yet generated
local colors = {
    background = "rgb(120D1A)",
    foreground = "rgb(E9DFF7)",
    color0 = "rgb(3D3747)",
    color1 = "rgb(3C3A67)",
    color2 = "rgb(4771B9)",
    color3 = "rgb(B15C6E)",
    color4 = "rgb(A85BAE)",
    color5 = "rgb(2384BA)",
    color6 = "rgb(8F7AAE)",
    color7 = "rgb(D6C9EB)",
    color8 = "rgb(968CA5)",
    color9 = "rgb(3D3A76)",
    color10 = "rgb(427DE1)",
    color11 = "rgb(D24E6A)",
    color12 = "rgb(C144CB)",
    color13 = "rgb(1FA8F2)",
    color14 = "rgb(BFA3E8)",
    color15 = "rgb(D6C9EB)",
}

local ok, loaded_colors = pcall(require, "colors-hyprland")
if ok and type(loaded_colors) == "table" then
    for k, v in pairs(loaded_colors) do
        colors[k] = v
    end
end

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 5,
        border_size = 2,
        col = {
            active_border = { colors = { colors.color11, colors.color13, colors.color12 }, angle = 45 },
            inactive_border = colors.background,
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 12,
        rounding_power = 3,

        blur = {
            enabled = true,
            xray = false,
            special = false,
            new_optimizations = true,
            size = 4,
            passes = 3,
            brightness = 1,
            noise = 0.01,
            contrast = 1,
            popups = true,
            popups_ignorealpha = 0.6,
        },

        shadow = {
            enabled = true,
            range = 20,
            offset = { 0, 4 },
            render_power = 4,
            color = "rgba(00000040)",
        },

        dim_inactive = true,
        dim_strength = 0.1,
        dim_special = 0,
    },

    animations = {
        enabled = true,
    },

    master = {
        new_on_top = true,
        new_status = "inherit",
        mfact = 0.5,
    },

    dwindle = {
        preserve_split = true,
        force_split = 2,
    },

    misc = {
        vrr = 2,
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },

    binds = {
        workspace_back_and_forth = false,
        movefocus_cycles_fullscreen = true,
    },

    group = {
        col = {
            border_active = { colors = { colors.color11, colors.color13, colors.color1, colors.color2 }, angle = 45 },
            border_inactive = colors.background,
            border_locked_active = { colors = { colors.color11, colors.color13, colors.color1, colors.color2 }, angle = 45 },
            border_locked_inactive = colors.background,
        },
        groupbar = {
            font_size = 10,
            col = {
                inactive = "rgb(262626)",
                locked_inactive = "rgb(262626)",
                active = colors.color11,
                locked_active = colors.color2,
            },
            text_color = colors.foreground,
            height = 16,
            stacked = false,
            gradients = true,
            gradient_rounding = 10,
            indicator_height = 0,
            gradient_round_only_edges = true,
            keep_upper_gap = false,
        },
    },
})

-- Animation curves
hl.curve("linear",         { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("md3_standard",   { type = "bezier", points = { {0.2, 0}, {0, 1} } })
hl.curve("md3_decel",      { type = "bezier", points = { {0.05, 1.15}, {0.1, 1} } })
hl.curve("md3_accel",      { type = "bezier", points = { {0.3, 0}, {0.8, 0.15} } })
hl.curve("overshot",       { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.1} } })
hl.curve("crazyshot",      { type = "bezier", points = { {0.1, 1.5}, {0.76, 0.92} } })
hl.curve("hyprnostretch",  { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.0} } })
hl.curve("menu_decel",     { type = "bezier", points = { {0.1, 1}, {0, 1} } })
hl.curve("menu_decel2",    { type = "bezier", points = { {0.1, 1.2}, {0, 1} } })
hl.curve("menu_accel",     { type = "bezier", points = { {0.38, 0.04}, {1, 0.07} } })
hl.curve("easeInOutCirc",  { type = "bezier", points = { {0.85, 0}, {0.15, 1} } })
hl.curve("easeOutCirc",    { type = "bezier", points = { {0, 0.55}, {0.45, 1} } })
hl.curve("easeOutExpo",    { type = "bezier", points = { {0.16, 1}, {0.3, 1} } })
hl.curve("softAcDecel",    { type = "bezier", points = { {0.26, 0.26}, {0.15, 1} } })
hl.curve("md2",            { type = "bezier", points = { {0.4, 0}, {0.2, 1} } })

-- Animations
hl.animation({ leaf = "windows",          enabled = true, speed = 5,   bezier = "menu_decel2", style = "gnomed" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 5,   bezier = "menu_decel2", style = "gnomed" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 3,   bezier = "md3_accel",   style = "gnomed" })
hl.animation({ leaf = "border",           enabled = true, speed = 10,  bezier = "default" })
hl.animation({ leaf = "fade",             enabled = true, speed = 3,   bezier = "easeOutExpo" })
hl.animation({ leaf = "layersIn",         enabled = true, speed = 3,   bezier = "menu_decel2", style = "slide" })
hl.animation({ leaf = "layersOut",        enabled = true, speed = 1.6, bezier = "menu_accel" })
hl.animation({ leaf = "fadeLayersIn",     enabled = true, speed = 2,   bezier = "menu_decel" })
hl.animation({ leaf = "fadeLayersOut",    enabled = true, speed = 4.5, bezier = "menu_accel" })
hl.animation({ leaf = "workspaces",       enabled = true, speed = 5,   bezier = "md3_decel",   style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 5,   bezier = "md3_decel",   style = "slidevert" })
