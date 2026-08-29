--------------------
---- LAYER RULES ---
--------------------

hl.layer_rule({
    name = "layerrule-1",
    match = { namespace = "notifications" },
    blur = true,
})

hl.layer_rule({
    name = "layerrule-2",
    match = { namespace = "wofi" },
    animation = "slide",
    blur = true,
})

hl.layer_rule({
    name = "layerrule-3",
    match = { namespace = "rofi" },
    animation = "slide",
    blur = true,
})

hl.layer_rule({
    name = "layerrule-4",
    match = { namespace = "swaync-control-center" },
    animation = "slide right",
    blur = true,
    ignore_alpha = 0.5,
})

hl.layer_rule({
    name = "layerrule-5",
    match = { namespace = "swaync-notification-window" },
    animation = "slidefade down",
    blur = true,
    ignore_alpha = 0.5,
})

hl.layer_rule({
    name = "layerrule-6",
    match = { namespace = "logout_dialog" },
    animation = "popin",
    ignore_alpha = 0.5,
})

hl.layer_rule({
    name = "layerrule-7",
    match = { namespace = "swayosd" },
    animation = "slide",
    blur = true,
    ignore_alpha = 0.5,
})

hl.layer_rule({
    name = "layerrule-8",
    match = { namespace = "waybar" },
    blur = true,
    ignore_alpha = 0.5,
})

hl.layer_rule({
    name = "layerrule-9",
    match = { namespace = "quickshell:overview" },
    animation = "slide up",
})
