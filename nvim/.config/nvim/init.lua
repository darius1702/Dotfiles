--     (_)___  (_) /_  / /_  ______ _
--    / / __ \/ / __/ / / / / / __ `/
--   / / / / / / /__ / / /_/ / /_/ /
--  /_/_/ /_/_/\__(_)_/\__,_/\__,_/

vim.g.mapleader = " "
vim.opt.termguicolors = true

-- transparent background
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

vim.cmd([[set undodir=$HOME/.config/nvim/undo]])
vim.o.grepprg="rg --vimgrep --no-heading -i --"

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

-- Quickfix list
vim.keymap.set("n", "<leader>co", ":copen<CR>", { silent = true })
vim.keymap.set("n", "<leader>cc", ":cclose<CR>", { silent = true })
vim.keymap.set("n", "]c", ":cnext<CR>", { silent = true })
vim.keymap.set("n", "[c", ":cprev<CR>", { silent = true })

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

-- formatoptions
vim.cmd([[au FileType * set fo-=o]])
-- Automatically delete all trailing whitespace on save
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])

vim.cmd([[autocmd FileType tex set spell]])

-- Plugins --
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
        no_italic = true,
        no_underline = true,
      })
      vim.cmd.colorscheme "catppuccin"
    end,
  },

  { 'windwp/nvim-autopairs', config = true },
  { 'kylechui/nvim-surround', config = true },

  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        delete = { text = '│' },
        changedelete = { text = '│' },
      },
    },
    lazy = false,
    keys = {
      { '<leader>hp', '<cmd>Gitsigns preview_hunk<cr>', desc = 'Preview Hunk'},
      { '<leader>hb', '<cmd>Gitsigns blame_line<cr>', desc = 'Blame current line'},
    }
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
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
    end,
  },
})
