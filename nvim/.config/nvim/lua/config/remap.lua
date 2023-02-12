vim.cmd([[vnoremap J :m '>+1<CR>gv=gv]])
vim.cmd([[vnoremap K :m '<-2<CR>gv=gv]])

vim.keymap.set("n", "<leader>p", "\"+p",{ silent = true })
vim.keymap.set("x", "<leader>p", "\"_dP",{ silent = true })
vim.keymap.set("n", "<leader>d", "\"_p",{ silent = true })
vim.keymap.set("v", "<leader>d", "\"_p",{ silent = true })

vim.keymap.set("n", "<leader>vp", ":VimuxPromptCommand<CR>",{ silent = true })
vim.keymap.set("n", "<leader>vl", ":VimuxRunLastCommand<CR>",{ silent = true })
vim.keymap.set("n", "<leader>vc", ":VimuxCloseRunner<CR>",{ silent = true })
vim.keymap.set("n", "<leader>vz", ":VimuxZoomRunner<CR>",{ silent = true })
vim.keymap.set("n", "<leader>vi", ":VimuxInterruptRunner<CR>",{ silent = true })
