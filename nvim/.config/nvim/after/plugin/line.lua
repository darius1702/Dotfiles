-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg          = '#e7eaf0',
  bg_inactive = '#e7eaf0',
  fg          = '#000000',
  red         = "#D20F39",
  green       = "#40A02B",
  yellow      = "#DF8E1D",
  blue        = "#1E66F5",
  magenta     = "#EA76CB",
  cyan        = "#179299",
  white       = "#ffffff",
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg_inactive } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {{'filename', cond = conditions.buffer_not_empty}},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  -- mode component
  'mode',
  color = function()
    return { fg = colors.white, bg = colors.blue, gui = 'bold' }
    -- return { fg = colors.bg, bg = mode_color[vim.fn.mode()], gui = 'bold' }
  end,
  padding = { right = 1, left = 1 },
  fmt = function(str)
    return string.sub(str, 1, 1)
  end,
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = {gui = "bold"},
  padding = {left = 1, right = 3}

}

ins_left {
  'branch',
  icon = '',
  padding = { right = 3 },
}

ins_left {
  'diff',
  symbols = { added = '+', modified = '~', removed = '-' },
  padding = {left = 1, right = 3},
  cond = conditions.hide_in_width,
}

ins_right {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = 'E:', warn = 'W:', info = 'I:', hint = 'H:' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
  padding = { left = 2, right = 1 },
}

ins_right {
  'location',
  padding = { left = 2, right = 1 },
}

ins_right {
  'progress',
  padding = { left = 2, right = 1 },
}

ins_right {
  'filetype',
  color = { gui = "bold" },
  padding = { left = 2, right = 1 },
}

lualine.setup(config)
