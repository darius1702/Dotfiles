local mainMod = "SUPER"

local bind_mod = function (key, fun)
    hl.bind(mainMod .. " + " .. key, fun)
end

local exec_cmd  = hl.dsp.exec_cmd
local window    = hl.dsp.window
local focus     = hl.dsp.focus
local workspace = hl.dsp.workspace
local layout    = hl.dsp.layout

-- apps
local terminal      = "foot"
local browser       = "zen-browser"
local displays      = "nwg-displays"
local zotero        = "gtk-launch zotero.desktop"
local emacs         = "emacsclient -cn -a ''"
local emacsUndelete = "emacsclient -e '(undelete-frame)'"
local lock          = "loginctl lock-session"
local scripts       = "~/Dotfiles/scripts/"
local ipc           = "noctalia msg "
local media         = ipc .. "media "
local launcher      = ipc .. "panel-toggle launcher"
local windowPicker  = ipc .. "panel-toggle launcher /win"
local cliphist      = ipc .. "panel-toggle clipboard"
local notifications = ipc .. "panel-toggle control-center notifications"

bind_mod("Q"             , window.close())
bind_mod("F"             , window.fullscreen({ mode = 0}))
bind_mod("I"             , window.toggle_swallow())
bind_mod("SHIFT + SPACE" , window.float())
bind_mod("TAB"           , focus({ workspace = "previous_per_monitor" }))

bind_mod("SHIFT + RETURN", layout("swapwithmaster"))
bind_mod("O"             , layout("cyclenext"))

bind_mod("RETURN"        , exec_cmd(terminal))
bind_mod("SPACE"         , exec_cmd(launcher))
bind_mod("E"             , exec_cmd(emacs))
bind_mod("SHIFT + E"     , exec_cmd(emacsUndelete))
bind_mod("CTRL + L"      , exec_cmd(lock))
bind_mod("N"             , exec_cmd(notifications))
bind_mod("B"             , exec_cmd(browser))
bind_mod("W"             , exec_cmd(windowPicker))
bind_mod("Z"             , exec_cmd(zotero))
bind_mod("C"             , exec_cmd(cliphist))
hl.bind("XF86Display"    , exec_cmd(displays))

-- colorpicker, ocr, qr decode on mod + mouse wheel
bind_mod("mouse:274"           , exec_cmd(scripts .. "colorpicker"))
bind_mod("SHIFT + mouse:274"   , exec_cmd(scripts .. "ocr-to-clipboard"))
bind_mod("CONTROL + mouse:274" , exec_cmd(scripts .. "qr-to-clipboard"))

-- screnshots
hl.bind("Print"                , exec_cmd(scripts .. "screenshot"))
hl.bind("SHIFT + Print"        , exec_cmd(scripts .. "screenshot -e ~/Pictures/Screenshots/$(date +'%d-%m-%Y_%H:%M').png"))

-- media keys
hl.bind("XF86AudioRaiseVolume" , exec_cmd(ipc .. "volume-up 3"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume" , exec_cmd(ipc .. "volume-down 3"), { locked = true, repeating = true })
hl.bind("XF86AudioMute"        , exec_cmd(ipc .. "volume-mute"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute"     , exec_cmd(ipc .. "mic-mute"), { locked = true, repeating = true })

hl.bind("XF86AudioNext"        , exec_cmd(media .. "next"), { locked = true })
hl.bind("XF86AudioPrev"        , exec_cmd(media .. "previous"), { locked = true })
hl.bind("XF86AudioPause"       , exec_cmd(media .. "toggle"), { locked = true })
hl.bind("XF86AudioPlay"        , exec_cmd(media .. "toggle"), { locked = true })

-- brightness
hl.bind("XF86MonBrightnessUp"  , exec_cmd("brightnessctl -e3 set 3%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", exec_cmd("brightnessctl -e3 set 3%-"), { locked = true, repeating = true })

-- (noctalia but this is cringe and doesn't work half the time)
-- hl.bind("XF86MonBrightnessUp"               , hl.dsp.exec_cmd(ipc .. "brightness-up"), { locked = true, repeating = true })
-- hl.bind("XF86MonBrightnessDown"             , hl.dsp.exec_cmd(ipc .. "brightness-down"), { locked = true, repeating = true })

-- 3 finger workspace swipe
hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace"
})

-- moving and resizing with mouse
bind_mod("mouse:272", window.drag(),   { mouse = true })
bind_mod("mouse:273", window.resize(), { mouse = true })

-- move focus, windows, and workspaces
for key, dir in pairs({
    h = "l",
    j = "d",
    k = "u",
    l = "r",
}) do
    bind_mod(                     key, focus({ direction = dir }))
    bind_mod("SHIFT + "        .. key, window.move({ direction = dir }))
    bind_mod("CTRL + SHIFT + " .. key, workspace.move({ monitor = dir }))
end

-- workspaces 1-10, f1-f12(11-22)
local function make_ws_bind(key, ws)
    bind_mod(              key, focus({ workspace = ws}))
    bind_mod("SHIFT + " .. key, window.move({ workspace = ws, follow = false }))
end
for i = 1, 10 do make_ws_bind(i % 10, i) end
for i = 1, 12 do make_ws_bind("F" .. i, i + 10) end
