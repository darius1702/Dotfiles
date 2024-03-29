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
    'projekt0n/github-nvim-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup({
        options = {
          transparent = true,
          styles = {
            functions = 'bold',
            keywords = 'bold',
            constants = 'bold',
          },
        },
      })
      vim.cmd('colorscheme github_dark_default')
    end,
  },

  -- Statusline
  'nvim-lualine/lualine.nvim',

  -- Ros
  {
    'tadachs/ros-nvim',
    opts = {
      only_workspace = true
    },
    keys = {
      {'<leader>tr', '<cmd>Telescope ros ros<cr>', desc = 'Telescope Finder'},
      {'<leader>rol', function() require('ros-nvim.ros').open_launch_include() end, desc = 'Follow links in launch files'},
      {'<leader>rdi', function() require('ros-nvim.ros').show_interface_definition() end, desc = 'Show definition for messages/services in floating window'},
    },
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim', 'nvim-treesitter/nvim-treesitter' },
  },

  { 'windwp/nvim-autopairs', config = true },

  -- Syntax
  { 'numToStr/Comment.nvim', config = true },
  { 'kylechui/nvim-surround', config = true },
  { 'norcalli/nvim-colorizer.lua', opts = '*' },

  -- Git
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

  -- tmux
  'christoomey/vim-tmux-navigator',

  -- Utils
  'nvim-lua/plenary.nvim',
  'nvim-lua/popup.nvim',
  {
    'nvim-telescope/telescope.nvim',
    keys = {
      {'<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find files'},
      {'<leader><leader>', '<cmd>Telescope buffers<cr>', desc = 'Find buffers'},
      {'<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help tags'},
      {'<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live grep'},
      {'<leader>fm', '<cmd>Telescope man_pages<cr>', desc = 'Man pages'},
      {'<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Current buffer fuzzy find'},
    },

    setup = function ()
      require('telescope').load_extension('fzf')
    end,

    opts = {
      pickers = {
        find_files = {
          theme = 'ivy',
          hidden = true,
          file_ignore_patterns = { '.git/', '^node_modules/' },
          borderchars = {
            preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
          },
        },
        live_grep = {
          theme = 'ivy',
          borderchars = {
            preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
          },
        },
        buffers = {
          theme = 'ivy',
          borderchars = {
            preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
          },
        },
        current_buffer_fuzzy_find = {
          theme = 'ivy',
          borderchars = {
            preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
          },
        },
        help_tags = {
          theme = 'ivy',
          borderchars = {
            preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
          },
        },
        man_pages = {
          -- list all sections instead of just (1)
          sections = { 'ALL' },
          theme = 'ivy',
          borderchars = {
            preview = { '─', '│', '─', '│', '┌', '┐', '┘', '└'},
          },
        },
      },
    },
    dependencies = {
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
      }
    },
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
