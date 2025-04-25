local wezterm = require("wezterm")
local act = wezterm.action

wezterm.on("gui-startup", function(cmd)
    local x = 350
    local y = 100

    local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
    window:gui_window():set_position(x, y)
end)

return {
    font_size = 16.0,
    tab_max_width = 60,
    window_decorations = "RESIZE",

    -- Initial window settings
    initial_cols = 120,
    initial_rows = 40,

    -- Enable pane navigation and splitting
    keys = {
        -- Split panes
        { key = "d",          mods = "CMD",        action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
        { key = "D",          mods = "CMD|SHIFT",  action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
        { key = 'w',          mods = 'CMD',        action = wezterm.action.CloseCurrentPane { confirm = true } },
        { key = '8',          mods = 'CTRL',       action = wezterm.action.PaneSelect },

        -- Pane directions
        { key = 'LeftArrow',  mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Left', },
        { key = 'RightArrow', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Right', },
        { key = 'DownArrow',  mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Down', },
        { key = 'UpArrow',    mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Up', },

        { key = 'LeftArrow',  mods = 'CTRL|CMD',   action = act.AdjustPaneSize { 'Left', 5 }, },
        { key = 'RightArrow', mods = 'CTRL|CMD',   action = act.AdjustPaneSize { 'Right', 5 }, },
        { key = 'DownArrow',  mods = 'CTRL|CMD',   action = act.AdjustPaneSize { 'Down', 5 }, },
        { key = 'UpArrow',    mods = 'CTRL|CMD',   action = act.AdjustPaneSize { 'Up', 5 }, },
    },

    background = {
        {
            source = {
                File = "/Users/max/Desktop/arts and wp/golfing_picture_old.jpg"
            },
            opacity = 1.0,
            hsb = {
                brightness = 0.01,
                saturation = 1.0,
            },
        },
    },

    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },

    inactive_pane_hsb = {
        saturation = 0.6,
        brightness = 0.3,
    },

    -- Optional: clean look
    enable_scroll_bar = false,
}
