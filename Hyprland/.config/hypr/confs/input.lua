---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout = "us",
        follow_mouse = 1,
        mouse_refocus = false,
        accel_profile = "flat",
        sensitivity = 0,

        touchpad = {
            natural_scroll = true,
            scroll_factor = 1,
        },
    },

    cursor = {
        no_warps = true,
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})
