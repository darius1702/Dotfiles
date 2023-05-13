--     (_)___  (_) /_  / /_  ______ _
--    / / __ \/ / __/ / / / / / __ `/
--   / / / / / / /__ / / /_/ / /_/ /
--  /_/_/ /_/_/\__(_)_/\__,_/\__,_/

vim.g.mapleader = " "
vim.opt.termguicolors = true

require("config")

vim.cmd[[highlight CursorLineNr guifg=#DBBC7F ]]
vim.cmd[[highlight CursorLine guibg=#1E2326]]
vim.cmd[[highlight @neorg.headings.3.prefix guifg=#7fbbb3]]
vim.cmd[[highlight @neorg.headings.3.title guifg=#7fbbb3]]

vim.cmd[[set nofoldenable]]
