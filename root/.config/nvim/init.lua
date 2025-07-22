vim.g.mapleader = " "
vim.opt.termguicolors = true

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

vim.cmd([[set spelllang=en_us]])
local settings = {
  laststatus = 1,
  scrolloff = 3,
  signcolumn = "yes",
  showmode = false,
  showcmd = false,
  number = true,
  relativenumber = true,
  splitbelow = true,
  splitright = true,
  langmenu = "en_US",
  expandtab = true,
  shiftwidth = 2,
  softtabstop = 2,
  smartindent = true,
  breakindent = true,
  updatetime = 50,
  mouse = "a",
  hlsearch = false,
  ignorecase = true,
  undofile = true,
  undoreload = 10000,
}

for k, v in pairs(settings) do
  vim.opt[k] = v
end

vim.g.netrw_altw = 1
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

-- Key bindings --
vim.keymap.set("i", "jk", "<ESC>", { silent = true })
vim.keymap.set("i", "<C-G>", "<ESC>", { silent = true })
vim.keymap.set("v", "<C-G>", "<ESC>", { silent = true })

-- Copy and paste
vim.keymap.set("n", "<leader>p", "\"+p", { silent = true })
vim.keymap.set("x", "<leader>p", "\"_dP", { silent = true })
vim.keymap.set("x", "<leader>y", "\"+y", { silent = true })
vim.keymap.set("n", "<leader>d", "\"_p", { silent = true })
vim.keymap.set("v", "<leader>d", "\"_p", { silent = true })

-- Open file under cursor in vertical split
vim.keymap.set("n", "<C-W><C-F>", "<C-W>vgf", { silent = true })

-- Open a file explorer
vim.keymap.set("n", "<leader>e", ":Ex<CR>", { silent = true })

