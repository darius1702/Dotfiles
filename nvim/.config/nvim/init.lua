--     (_)___  (_) /_  / /_  ______ _
--    / / __ \/ / __/ / / / / / __ `/
--   / / / / / / /__ / / /_/ / /_/ /
--  /_/_/ /_/_/\__(_)_/\__,_/\__,_/

vim.g.mapleader = ' '
vim.o.termguicolors = true

vim.cmd([[colorscheme lunaperche]])

vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })

vim.cmd([[set spelllang=en_us]])
local settings = {
  laststatus = 2,
  scrolloff = 3,
  signcolumn = 'yes',
  showmode = false,
  showcmd = false,
  number = false,
  relativenumber = false,
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

vim.cmd([[set undodir=$HOME/.config/nvim/undo]])
vim.o.grepprg='rg --vimgrep --no-heading -i --'

for k, v in pairs(settings) do
  vim.o[k] = v
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

-- formatoptions
vim.cmd([[au FileType * set fo-=o]])
-- Automatically delete all trailing whitespace on save
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])

vim.cmd([[autocmd FileType tex set spell]])

function gh(str)
  return 'https://github.com/' .. str
end

-- Plugins --
vim.pack.add({
  gh('windwp/nvim-autopairs'),
  gh('kylechui/nvim-surround'),
  gh('lewis6991/gitsigns.nvim'),
  gh('nvim-treesitter/nvim-treesitter'),
})

require('nvim-autopairs').setup()
require('nvim-surround').setup()

require('nvim-treesitter').setup {
  ensure_installed = { 'c', 'cpp', 'lua', 'markdown' },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
}

require('gitsigns').setup({
  on_attach = function(_)
    local gitsigns = require('gitsigns')
    map('n', '<leader>ht', gitsigns.toggle_signs)
    map('n', '<leader>hp', gitsigns.preview_hunk)
    map('n', '<leader>hb', gitsigns.blame_line)
  end
})
