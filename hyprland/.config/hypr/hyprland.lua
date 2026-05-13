require("monitors")
require("environment")
require("binds")
-- require("windowrules")

hl.on("hyprland.start", function ()
  hl.exec_cmd("hyprpm reload")
  hl.exec_cmd("hypridle")
  hl.exec_cmd("hyprpolkitagent")
  hl.exec_cmd("hyprsunset")

  hl.exec_cmd("swaybg -i $HOME/.config/hypr/current_wallpaper -m fill")
  hl.exec_cmd("$HOME/Dotfiles/scripts/waybar-hotreload") -- status bar
  hl.exec_cmd("swaync")                                  -- notifications
  hl.exec_cmd("solaar -w hide -b solaar")                -- logitech devices
  hl.exec_cmd("syshud -p top")                           -- pretty OSD
  hl.exec_cmd("batsignal -w 15 -c 8")                    -- low battery notification
  hl.exec_cmd("blueman-applet")                          -- bluetooth
  hl.exec_cmd("vicinae server")
end)

hl.config({
    input = {
        kb_layout = "de",
        kb_variant = "us",
        kb_model = "",
        kb_options = "ctrl:nocaps",
        kb_rules = "",

        repeat_rate = 40,
        repeat_delay = 300,

        follow_mouse = 2,
        float_switch_override_focus = 0,
        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
            tap_to_click = false,
            clickfinger_behavior = true,
        },
    },

    cursor =  {
        no_warps = true,
        inactive_timeout = 5,
    },


    general = {
        gaps_in       = 3,
        gaps_out      = 5,
        float_gaps    = 5,
        border_size   = 3,

        allow_tearing = false,

        layout        = "master",

        col = {
            active_border   = "rgba(ffeeeeaa)",
            inactive_border = "rgba(43434399)",
        },

        snap = {
            enabled      = true,
            respect_gaps = true,
            window_gap   = 15,
            monitor_gap  = 15,
        },
    },

    master = {
        orientation = "left",
        new_on_active = "false",
    },

    decoration = {
        rounding              = 2,
        rounding_power        = 4,
        border_part_of_window = false,

        blur = {
            enabled  = false,
            size     = 8,
            noise    = 0,
            contrast = 1,
        },

        shadow = {
            enabled      = true,
            range        = 15,
            render_power = 3,
            color        = "rgba(00000088)",
        },

    },

    animations = {
        enabled = true,
    },

    misc = {
        font_family = "SF Pro Text",
        enable_swallow = true,
        swallow_regex = "^foot$",
        disable_hyprland_logo = true,
    },
})

hl.curve("easeOutCubic", { type = "bezier", points = { {0.33, 1}, {0.68, 1} }})

hl.animation({ leaf = "global",      enabled = false })
hl.animation({ leaf = "windows",     enabled = true,  speed = 1,   bezier = "easeOutCubic", style = "popin 70%" })
hl.animation({ leaf = "layers",      enabled = true,  speed = 1,   bezier = "easeOutCubic", style = "fade" })
hl.animation({ leaf = "fadeLayers",  enabled = true,  speed = 1,   bezier = "easeOutCubic" })
hl.animation({ leaf = "workspaces",  enabled = true,  speed = 1.3, bezier = "easeOutCubic", style = "slide" })
