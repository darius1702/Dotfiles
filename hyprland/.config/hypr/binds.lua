local mainMod = "SUPER"

local terminal      = "foot"
local browser       = "zen-browser"
local zotero        = "gtk-launch zotero.desktop"
local emacs         = "emacsclient -cn -a ''"
local lock          = "loginctl lock-session"
local menu          = "vicinae toggle"
local cliphist      = "vicinae vicinae://launch/clipboard/history"
local passmenu      = "vicinae vicinae://launch/@tinkerbells/store.vicinae.pass/pass"
local notifications = "swaync-client -t -sw"

local function scripts(name)
    return "/home/darius/Dotfiles/scripts/" .. name
end

hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace"
})

hl.bind(mainMod .. " + Q"                   , hl.dsp.window.close())
hl.bind(mainMod .. " + F"                   , hl.dsp.window.fullscreen({ mode = 0}))
hl.bind(mainMod .. " + I"                   , hl.dsp.window.toggle_swallow())
hl.bind(mainMod .. " + Tab"                 , hl.dsp.focus({ urgent_or_last = true }))
hl.bind(mainMod .. " + SHIFT + SPACE"       , hl.dsp.window.float())

hl.bind(mainMod .. " + SHIFT + RETURN"      , hl.dsp.layout("swapwithmaster"))
hl.bind(mainMod .. " + O"                   , hl.dsp.layout("cyclenext"))

hl.bind(mainMod .. " + RETURN"              , hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SPACE"               , hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + E"                   , hl.dsp.exec_cmd(emacs))
hl.bind(mainMod .. " + SHIFT + E"           , hl.dsp.exec_cmd("emacsclient -e '(undelete-frame)'"))
hl.bind(mainMod .. " + CTRL + L"            , hl.dsp.exec_cmd(lock))
hl.bind(mainMod .. " + N"                   , hl.dsp.exec_cmd(notifications))
hl.bind(mainMod .. " + SHIFT + P"           , hl.dsp.exec_cmd(passmenu))
hl.bind(mainMod .. " + B"                   , hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + Z"                   , hl.dsp.exec_cmd(zotero))
hl.bind(mainMod .. " + C"                   , hl.dsp.exec_cmd(cliphist))
hl.bind(mainMod .. " + S"                   , hl.dsp.exec_cmd(scripts("find_pdf")))
hl.bind(mainMod .. " + SHIFT + S"           , hl.dsp.exec_cmd(scripts("find_book")))
hl.bind(mainMod .. " + XF86Display"         , hl.dsp.exec_cmd("nwg-displays"))
hl.bind(mainMod .. " + mouse:274"           , hl.dsp.exec_cmd(scripts("colorpicker")))

-- screnshots and qr code reader
hl.bind("Print"                             , hl.dsp.exec_cmd(scripts("screenshot")))
hl.bind("SHIFT + Print"                     , hl.dsp.exec_cmd(scripts("screenshot -e ~/Pictures/screenshot_$(date +'%d-%m-%Y_%H:%M').png")))
hl.bind("CTRL + Print"                      , hl.dsp.exec_cmd(scripts("qr-to-clipboard")))

-- move window with mouse
hl.bind(mainMod .. " + mouse:272"           , hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273"           , hl.dsp.window.resize(), { mouse = true })

-- media keys
hl.bind("XF86AudioRaiseVolume"              , hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume"              , hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute"                     , hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute"                  , hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })

hl.bind("XF86AudioNext"                     , hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause"                    , hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay"                     , hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev"                     , hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- brightness
hl.bind("XF86MonBrightnessUp"               , hl.dsp.exec_cmd("brightnessctl -e3 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown"             , hl.dsp.exec_cmd("brightnessctl -e3 set 5%-"), { locked = true, repeating = true })

-- moving focus
hl.bind(mainMod .. " + h"                   , hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + l"                   , hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + k"                   , hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + j"                   , hl.dsp.focus({ direction = "d" }))

-- moving windows
hl.bind(mainMod .. " + SHIFT + h"           , hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + l"           , hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + k"           , hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + j"           , hl.dsp.window.move({ direction = "d" }))

-- moving workspaces between monitors
hl.bind(mainMod .. " + CTRL + SHIFT + h"    , hl.dsp.workspace.move({ monitor = "l" }))
hl.bind(mainMod .. " + CTRL + SHIFT + l"    , hl.dsp.workspace.move({ monitor = "r" }))
hl.bind(mainMod .. " + CTRL + SHIFT + k"    , hl.dsp.workspace.move({ monitor = "u" }))
hl.bind(mainMod .. " + CTRL + SHIFT + j"    , hl.dsp.workspace.move({ monitor = "d" }))

-- move with 1-10, f1-f12
for i = 1 , 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key         , hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key , hl.dsp.window.move({ workspace = i, follow = false }))
end

for i = 1 , 12 do
    local key = "F" .. i
    hl.bind(mainMod .. " + " .. key         , hl.dsp.focus({ workspace = 10 + i}))
    hl.bind(mainMod .. " + SHIFT + " .. key , hl.dsp.window.move({ workspace = 10 + i, follow = false }))
end
