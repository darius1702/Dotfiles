local lualine = require 'lualine'

local config = {
  options = {
    theme = 'gruvbox',

    -- no arrows in tabline
    section_separators = '',
    component_separators = ''
  }
}

-- initialize lualine
lualine.setup(config)
