-- Exit insert mode
vim.keymap.set("i", "jk", "<ESC>", { silent = true })
vim.keymap.set("i", "<C-G>", "<ESC>", { silent = true })
vim.keymap.set("v", "<C-G>", "<ESC>", { silent = true })

-- Quickfix list
vim.keymap.set("n", "<leader>co", ":copen<CR>", { silent = true })
vim.keymap.set("n", "<leader>cc", ":cclose<CR>", { silent = true })
vim.keymap.set("n", "]c", ":cnext<CR>", { silent = true })
vim.keymap.set("n", "[c", ":cprev<CR>", { silent = true })

vim.keymap.set("n", "<leader>p", "\"+p", { silent = true })
vim.keymap.set("x", "<leader>p", "\"_dP", { silent = true })
vim.keymap.set("x", "<leader>y", "\"+y", { silent = true })
vim.keymap.set("n", "<leader>d", "\"_p", { silent = true })
vim.keymap.set("v", "<leader>d", "\"_p", { silent = true })

-- Open file under cursor in vertical split
vim.keymap.set("n", "<C-W><C-F>", "<C-W>vgf", { silent = true })

-- Open a file explorer
vim.keymap.set("n", "<leader>e", ":Ex<CR>", { silent = true })
