--     (_)___  (_) /_  / /_  ______ _
--    / / __ \/ / __/ / / / / / __ `/
--   / / / / / / /__ / / /_/ / /_/ /
--  /_/_/ /_/_/\__(_)_/\__,_/\__,_/

vim.g.mapleader = " "
vim.opt.termguicolors = true

require("config")

vim.cmd[[highlight LineNr guifg=#f4bf75]]
vim.cmd[[highlight LineNrBelow guifg=#727272]]
vim.cmd[[highlight LineNrAbove guifg=#727272]]
vim.cmd[[highlight IncSearch guifg=#151515 guibg=#f4bf75]]
vim.cmd[[highlight lualine_a_normal guifg=#88afa2]]
vim.cmd[[highlight lualine_a_insert guifg=#90a959]]
vim.cmd[[highlight lualine_a_visual guifg=#cc6666]]
vim.cmd[[highlight lualine_a_replace guifg=#f4bf75]]
vim.cmd[[highlight lualine_a_command guifg=#aa759f]]
vim.cmd[[highlight lualine_c_normal guibg=#202020]]
