--     (_)___  (_) /_  / /_  ______ _
--    / / __ \/ / __/ / / / / / __ `/
--   / / / / / / /__ / / /_/ / /_/ /
--  /_/_/ /_/_/\__(_)_/\__,_/\__,_/

vim.g.mapleader = " "
vim.opt.termguicolors = true

require("config")

vim.cmd[[highlight CursorLineNr guifg=#DBBC7F ]]
vim.cmd[[highlight CursorLine guibg=#1E2326]]
vim.cmd[[highlight lualine_c_normal guibg=NONE]]
vim.cmd[[highlight lualine_c_insert guibg=NONE]]
vim.cmd[[highlight lualine_c_replace guibg=NONE]]
vim.cmd[[highlight lualine_c_visual guibg=NONE]]
vim.cmd[[highlight lualine_c_command guibg=NONE]]

vim.cmd[[set foldmethod=expr]]
vim.cmd[[set foldexpr=nvim_treesitter#foldexpr()]]
vim.cmd[[set nofoldenable]]
