vim.cmd([[vnoremap J :m '>+1<CR>gv=gv]])
vim.cmd([[vnoremap K :m '<-2<CR>gv=gv]])

-- Quickfix list
vim.keymap.set("n", "<leader>co", ":copen<CR>", { silent = true })
vim.keymap.set("n", "<leader>cc", ":cclose<CR>", { silent = true })
vim.keymap.set("n", "]c", ":cnext<CR>", { silent = true })
vim.keymap.set("n", "[c", ":cprev<CR>", { silent = true })

vim.keymap.set("n", "<leader>p", "\"+p",{ silent = true })
vim.keymap.set("x", "<leader>p", "\"_dP",{ silent = true })
vim.keymap.set("x", "<leader>y", "\"+y",{ silent = true })
vim.keymap.set("n", "<leader>d", "\"_p",{ silent = true })
vim.keymap.set("v", "<leader>d", "\"_p",{ silent = true })
