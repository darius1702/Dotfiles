vim.g.mapleader = ' '
vim.o.termguicolors = true

vim.cmd([[colorscheme slate]])

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })
vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'LightGray', fg = 'Black' })


vim.cmd([[set spelllang=en_us]])
local settings = {
  laststatus = 1,
  scrolloff = 3,
  signcolumn = 'yes',
  showmode = false,
  showcmd = false,
  number = true,
  relativenumber = true,
  linebreak = true,
  splitbelow = true,
  splitright = true,
  langmenu = 'en_US',
  expandtab = true,
  shiftwidth = 2,
  softtabstop = 2,
  smartindent = true,
  breakindent = true,
  updatetime = 50,
  mouse = 'a',
  hlsearch = false,
  ignorecase = true,
  undofile = true,
  undoreload = 10000,
}

for k, v in pairs(settings) do
  vim.opt[k] = v
end

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.g.netrw_altw = 1
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

-- Key bindings --
function map(mode, l, r, opts)
  opts = opts or { silent = true }
  vim.keymap.set(mode, l, r, opts)
end

-- Help on F1 is annoying
map({'i', 'n'}, '<F1>', '<NOP>')

map('i', 'jk', '<ESC>')
map({'i', 'v'}, '<C-G>', '<ESC>')

-- Copy and paste
map({'n', 'x'}, '<leader>p', '\"+p')
map({'n', 'v'}, '<leader>d', '\"_p')
map('x', '<leader>y', '\"+y')

-- Open file under cursor in vertical split
map('n', '<C-W><C-F>', '<C-W>vgf')

-- Open a file explorer
map('n', '<leader>e', vim.cmd.Ex)
