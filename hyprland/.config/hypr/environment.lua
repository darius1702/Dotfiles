-- cursors
hl.env("HYPRCURSOR_THEME","Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE","20")
hl.env("XCURSOR_THEME","Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE","20")

-- Some default env vars
hl.env("XDG_SESSION_TYPE","wayland")
hl.env("XDG_CURRENT_DESKTOP","Hyprland") -- Otherwise there is some "XDG_CURRENT_DESKTOP is managed externally ..." error
hl.env("MOZ_ENABLE_WAYLAND","1")
hl.env("GDK_BACKEND","wayland")
hl.env("SSH_AUTH_SOCK","$XDG_RUNTIME_DIR/ssh-agent.socket")
