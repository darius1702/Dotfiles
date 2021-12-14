local lualine = require 'lualine'

local config = {
  options = {
    theme = 'auto',
    icons_enabled = false,

    -- no arrows in tabline
    section_separators = '',
    component_separators = ''
  }
}

-- initialize lualine
lualine.setup(config)
