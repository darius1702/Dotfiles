local lualine = require 'lualine'

local config = {
  options = {
    theme = 'auto',

    -- no arrows in tabline
    section_separators = '',
    component_separators = ''
  }
}

-- initialize lualine
lualine.setup(config)
