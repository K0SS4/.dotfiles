hl.monitor({
  output = "DP-2",
  mode = "2560x1440@165",
  position = "0x0",
  scale = 1,
})

hl.monitor({
  output = "DP-1",
  mode = "2560x1440@165",
  position = "2560x0",
  scale = 1,
})

hl.on("hyprland.start", function ()
    hl.exec_cmd("uwsm app -- waybar -c ~/.config/waybar/config-hypr-1 -s ~/.config/waybar/style-hypr.css")
    hl.exec_cmd("uwsm app -- waybar -c ~/.config/waybar/config-hypr-2 -s ~/.config/waybar/style-hypr.css")

    hl.exec_cmd("uwsm app -- nm-applet --indicator")
    hl.exec_cmd("uwsm app -- swaync -c ~/.config/swaync/config.json -s ~/.config/swaync/style.css")

    hl.exec_cmd("uwsm app -- hyprpaper")
    hl.exec_cmd("uwsm app -- poweralertd")
    hl.exec_cmd("uwsm app -- hypridle")

    hl.exec_cmd("uwsm app -- wl-paste --type text --watch cliphist store")  -- Stores only text data
    hl.exec_cmd("uwsm app -- wl-paste --type image --watch cliphist store") -- Stores only image data
end)

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 3,
        gaps_out = 15,

        border_size = 2,

        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = false,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
    },

    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },

    input = {
        kb_layout  = "pl",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
        numlock_by_default = true,
    },
})

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })


-- Core Binds
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("uwsm app -- alacritty"))
hl.bind(mainMod .. " + W", hl.dsp.window.close({ window = 'activewindow' }))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exit())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("uwsm app -- thunar"))
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + RETURN", hl.dsp.exec_cmd("uwsm app -- wofi -a -S drun -p Run: -i -I"))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + SPACE", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("uwsm app -- cliphist list | wofi -a -S dmenu -p Search: | cliphist decode | wl-copy"))

-- Move focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Move window in direction
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Workspaces
for i = 1, 6 do
    -- Switch to workspace
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
    -- Move active window to workspace
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Scroll through existing workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Mouse bindings
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Keyboard resizing 
hl.bind(mainMod .. " + CONTROL + L", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CONTROL + H", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CONTROL + K", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CONTROL + J", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

-- System / Media Keys
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("uwsm app -- ~/.config/waybar/scripts/reload.sh"))
hl.bind("SHIFT + F4", hl.dsp.exec_cmd("uwsm app -- qt-powermenu"))
hl.bind(mainMod .. " + SHIFT + N", hl.dsp.exec_cmd("uwsm app -- swaync-client -t -sw"))

-- Audio/Media (with repeating = true for volume controls)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("uwsm app -- pamixer --increase 5"), { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("uwsm app -- pamixer --decrease 5"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("uwsm app -- pamixer --toggle-mute"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("uwsm app -- playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("uwsm app -- playerctl previous"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("uwsm app -- playerctl play-pause"))
hl.bind("Print", hl.dsp.exec_cmd("uwsm app -- slurp -b ffffff20 | grim -g - - | wl-copy"))

-- Window Rules
hl.window_rule({
    match = { class = "qt-powermenu" },
    stay_focused = true,
    center = true
})

hl.window_rule({
    match = { class = "^(xwaylandvideobridge)$" },
    opacity = "0.0 override",
    no_anim = true,
    no_initial_focus = true,
    max_size = {"1", "1"},
    no_blur = true
})

hl.window_rule({
    match = { class = "*" },
    idle_inhibit = "fullscreen"
})

hl.window_rule({
    match = { class = "protonvpn-app" },
    size = {"400", "600"},
    center = true
})
