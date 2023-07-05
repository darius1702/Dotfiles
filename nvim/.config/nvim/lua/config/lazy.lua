local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({

  -- Colors
  {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_transparent_background = 1
      vim.g.everforest_better_performance = 1
      vim.g.everforest_disable_italic_comment = 1
      vim.g.everforest_diagnostic_virtual_text = "colored"
      vim.g.everforest_background = "hard"
      vim.cmd[[ let g:everforest_colors_override = {'fg' : ['#e1e1e1', '223'], 'bg_visual' : ['#2E383C', '52']} ]]
      vim.cmd.colorscheme('everforest')
    end,
  },

  -- {
  --   "darius1702/kit.vim",
  --   dir = "/home/darius/Projects/kit.vim/",
  --   dev = "true"
  -- },

  -- Statusline
  "nvim-lualine/lualine.nvim",

  -- Org mode
  {
    "nvim-orgmode/orgmode",
    config = function()
      require('orgmode').setup_ts_grammar()

      require('nvim-treesitter.configs').setup {
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = {'org'},
        },
        ensure_installed = {'org'},
      }

      require('orgmode').setup({
        org_agenda_files = {'~/Documents/Org/**'},
        org_default_notes_file = '~/Documents/Org/refile.org',
      })
    end
  },



  -- Ros
  {
    'tadachs/ros-nvim',
    config = function()
      require("ros-nvim").setup({only_workspace = true })

      -- telescope finder
      vim.keymap.set('n', '<leader>tr', '<cmd>Telescope ros ros<cr>', { noremap = true })

      -- follow links in launch files
      vim.keymap.set('n', '<leader>rol', function() require("ros-nvim.ros").open_launch_include() end, { silent = true, noremap = true })

      -- show definition for messages/services in floating window
      vim.keymap.set('n', '<leader>rdi', function() require("ros-nvim.ros").show_interface_definition() end, { silent = true, noremap = true })
    end,
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim", "nvim-treesitter/nvim-treesitter" },
  },

  -- Jupyter
  {
    "untitled-ai/jupyter_ascending.vim",
    init = function ()
      vim.g.jupyter_ascending_default_mappings = false
    end,
    keys = {
      { "<leader>jx", "<Plug>JupyterExecute", desc = "Execute Notebook Cell"},
      { "<leader>jX", "<Plug>JupyterExecuteAll", desc = "Execute all Notebook Cells"},
      { "<leader>jr", "<Plug>JupyterRestart", desc = "Restart jupyter_ascending"},
    }
  },

  -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_command_for_global = 1
      vim.g.mkdp_browser = "surf"
    end,
    ft = "markdown"
    -- cmd = {"MarkdownPreview"},
  },

  -- LaTeX
  { "lervag/vimtex", ft = "tex" },

  -- Autopairs
  { "windwp/nvim-autopairs", config = true },

  -- Syntax
  { "numToStr/Comment.nvim", config = true },
  { "kylechui/nvim-surround", config = true },
  { "norcalli/nvim-colorizer.lua", opts = '*' },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        delete = { text = "│" },
        changedelete = { text = "│" },
      },
    },
    lazy = false,
    keys = {
      { "<leader>hp", "<cmd>Gitsigns preview_hunk<cr>", desc = "Preview Hunk"},
      { "<leader>hb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame current line"},
    }
  },
  {
    "NeogitOrg/neogit",
    config = true,
    keys = {
      { "<leader>gs", "<cmd>Neogit kind=replace<cr>", desc = "Neogit" }
    }
  },

  -- tmux
  {
    "preservim/vimux",
    keys = {
      {"<leader>vp", "<cmd>VimuxPromptCommand<cr>", desc = "VimuxPromptCommand"},
      {"<leader>vl", "<cmd>VimuxRunLastCommand<cr>", desc = "VimuxRunLastCommand"},
      {"<leader>vc", "<cmd>VimuxCloseRunner<cr>", desc = "VimuxCloseRunner"},
      {"<leader>vz", "<cmd>VimuxZoomRunner<cr>", desc = "VimuxZoomRunner"},
      {"<leader>vi", "<cmd>VimuxInterruptRunner<cr>", desc = "VimuxInterruptRunner"},
    },
  },
  "christoomey/vim-tmux-navigator",

  -- Utils
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {"<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files"},
      {"<leader><leader>", "<cmd>Telescope buffers<cr>", desc = "Find buffers"},
      {"<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags"},
      {"<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep"},
      {"<leader>fm", "<cmd>Telescope man_pages<cr>", desc = "Man pages"},
      {"<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Current buffer fuzzy find"},
    },
    opts = {
      pickers = {
        find_files = {
          theme = "ivy",
          hidden = true,
          file_ignore_patterns = { ".git/", "^node_modules/" }
        },
        live_grep = {
          theme = "ivy",
        },
        buffers = {
          theme = "ivy",
        },
        current_buffer_fuzzy_find = {
          theme = "ivy",
        },
        help_tags = {
          theme = "ivy",
        },
        man_pages = {
          -- list all sections instead of just (1)
          sections = { "ALL" },
          theme = "ivy",
        },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "c", "lua", "vim", "help", "cpp", "markdown" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          -- Let vimtex handle latex highlighting
          disable = { "latex" },
          additional_vim_regex_highlighting = false,
        }
      }
    end,
  },

  -- LSPZero
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {
        'hrsh7th/nvim-cmp', -- Required
        opts = {
          sources = {
            { name = 'orgmode' },
          }
        }
      },
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-buffer'},
    }
  }
})
