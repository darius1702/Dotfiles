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

  -- Statusline
  "nvim-lualine/lualine.nvim",

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
      vim.keymap.set('n', '<leader>rdm', function() require("ros-nvim.ros").show_message_definition() end, { silent = true, noremap = true })
      vim.keymap.set('n', '<leader>rds', function() require("ros-nvim.ros").show_service_definition() end, { silent = true, noremap = true })
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
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

  -- Neorg
  {
    "nvim-neorg/neorg",
    cmd = "Neorg",
    build = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/Documents/Notes/neorg/",
            },
            default_workspace = "notes",
          },
        },
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          }
        },
        ["core.integrations.treesitter"] = {},
        ["core.concealer"] = {
          config = {
            icons = {
              todo = {
                undone = {
                  icon = " ",
                },
                done = {
                  icon = "×",
                },
              },
            },
          },
        },
      },
    },
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },

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
    "TimUntersberger/neogit",
    config = true,
    keys = {
      { "<leader>gs", "<cmd>Neogit kind=replace<cr>", desc = "Neogit" }
    }
  },

  -- tmux
  {
    "preservim/vimux",
    keys = {
      {"<leader>vp", ":VimuxPromptCommand<CR>", desc = "VimuxPromptCommand"},
      {"<leader>vl", ":VimuxRunLastCommand<CR>", desc = "VimuxRunLastCommand"},
      {"<leader>vc", ":VimuxCloseRunner<CR>", desc = "VimuxCloseRunner"},
      {"<leader>vz", ":VimuxZoomRunner<CR>", desc = "VimuxZoomRunner"},
      {"<leader>vi", ":VimuxInterruptRunner<CR>", desc = "VimuxInterruptRunner"},
    },
  },
  "christoomey/vim-tmux-navigator",

  -- Utils
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "nvim-telescope/telescope.nvim",
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
  "nvim-treesitter/playground",

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
      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-buffer'},
    }
  }
})
