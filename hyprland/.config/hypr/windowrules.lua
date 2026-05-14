hl.window_rule({
    name = "make-icemon-floating",
    match = { class = "org.kde.icemon" },
    size = { 650, 500 },
    float = true,
})

hl.window_rule({
    name = "make-resources-floating",
    match = { class = "net.nokyan.Resources" },
    float = true,
})

hl.window_rule({
    name = "make-iwgtk-floating",
    match = { class = "org.twosheds.iwgtk" },
    size = { 600, 700 },
    float = true,
})

hl.window_rule({
    name = "make-weather-floating",
    match = { class = "org.gnome.Weather" },
    size = { 750, 600 },
    float = true,
})

hl.window_rule({
    name = "make-pwvucontrol-floating",
    match = { class = "com.saivert.pwvucontrol" },
    size = { 1000, 600 },
    float = true,
})

hl.window_rule({
    name = "make-blueman-floating",
    match = { class = "blueman-manager" },
    size = { 300, 600 },
    float = true,
})

hl.window_rule({
    name = "floating-decorations",
    match = { float = true },
    border_size = 1,
})

hl.window_rule({
    name = "only-shadow-on-floating",
    match = { float = false },
    no_shadow = true,
})
