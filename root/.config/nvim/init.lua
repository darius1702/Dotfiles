vim.g.mapleader = " "
vim.o.termguicolors = true

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
function map(mode, l, r, opts)
  opts = opts or { silent = true }
  vim.keymap.set(mode, l, r, opts)
end

map('i', 'jk', '<ESC>')
map('i', '<C-G>', '<ESC>')
map('v', '<C-G>', '<ESC>')

-- Quickfix list
map('n', '<leader>co', vim.cmd.copen)
map('n', '<leader>cc', vim.cmd.cclose)
map('n', ']c', function () pcall(vim.cmd.cnext) end)
map('n', '[c', function () pcall(vim.cmd.cprev) end)

-- Copy and paste
map('n', '<leader>p', '\"+p')
map('x', '<leader>p', '\"_dP')
map('x', '<leader>y', '\"+y')
map('n', '<leader>d', '\"_p')
map('v', '<leader>d', '\"_p')

-- Open file under cursor in vertical split
map('n', '<C-W><C-F>', '<C-W>vgf')

-- Open a file explorer
map('n', '<leader>e', vim.cmd.Ex)
