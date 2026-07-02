-- cursors
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE", "20")
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE", "20")

-- XDG stuff
-- hl.env("XDG_SESSION_TYPE", "wayland")
-- hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
-- hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- tell apps to use wayland
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("SDL_VIDEODRIVER", "wayland")

-- ssh agent
local runtime_dir = os.getenv("XDG_RUNTIME_DIR") or "/run/user/1000"
hl.env("SSH_AUTH_SOCK", runtime_dir .. "/ssh-agent.socket")
