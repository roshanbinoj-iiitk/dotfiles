------------------------------
---- PLUGIN CONFIGURATION ----
------------------------------

local colors = {
    color4 = "rgb(A85BAE)",
}

local ok, loaded_colors = pcall(require, "colors-hyprland")
if ok and type(loaded_colors) == "table" and loaded_colors.color4 then
    colors.color4 = loaded_colors.color4
end

if hl.plugin.overview ~= nil then
    hl.config({
        plugin = {
            overview = {
                gapsIn = 5,
                gapsOut = 5,
                onBottom = true,
                workspaceActiveBorder = colors.color4,
                drawActiveWorkspace = false,
                affectStrut = true,
                showSpecialWorkspace = false,
                showEmptyWorkspace = true,
                showNewWorkspace = true,
            },
        },
    })
end
