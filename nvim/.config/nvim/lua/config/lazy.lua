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

  { 'windwp/nvim-autopairs', config = true },
  { 'numToStr/Comment.nvim', config = true },
  { 'kylechui/nvim-surround', config = true },

  { 'norcalli/nvim-colorizer.lua', opts = '*' },

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
        ensure_installed = { 'c', 'lua', 'vim', 'cpp', 'markdown' },
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
