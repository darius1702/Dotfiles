hl.window_rule({
    match = { class = "dev.noctalia.Noctalia" },
    float = true,
    size = { 1080, 920 },
})

hl.window_rule({
    match = { class = "org.kde.icemon" },
    size = { 650, 500 },
    float = true,
})

hl.window_rule({
    match = { class = "net.nokyan.Resources" },
    float = true,
})

hl.window_rule({
    match = { class = "be.alexandervanhee.gradia" },
    float = true,
})

hl.window_rule({
    match = { class = "org.gnome.Weather" },
    size = { 750, 600 },
    float = true,
})

hl.window_rule({
    match = { class = "com.saivert.pwvucontrol" },
    size = { 1000, 600 },
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
