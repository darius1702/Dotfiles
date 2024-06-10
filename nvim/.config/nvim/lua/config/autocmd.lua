-- formattoptions
vim.cmd([[au FileType * set fo-=o]])
-- Automatically delete all trailing whitespace on save
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])

vim.cmd([[autocmd FileType tex set spell]])
