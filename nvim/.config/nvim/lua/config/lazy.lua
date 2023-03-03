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
    "aktersnurra/no-clown-fiesta.nvim",
    config = function()
      require('no-clown-fiesta').setup{
        transparent = true,
      }
      vim.cmd.colorscheme('no-clown-fiesta')
    end,
  },
  {
    "darius1702/kit.vim",
    dir = "~/Projects/kit.vim/"
  },

  -- Statusline
  "nvim-lualine/lualine.nvim",

  -- Ros
  {
    'tadachs/ros-nvim',
    config = function() require("ros-nvim").setup({only_workspace = true }) end,
    -- branch = "devel",
    dependencies = { "tadachs/mutils.nvim" },
  },

  -- LaTeX
  {
    "lervag/vimtex",
    ft = "tex",
  },

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    config = true,
  },

  -- Neorg
  {
    "nvim-neorg/neorg",
    lazy = true,
    build = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.norg.dirman"] = {
          config = {
            workspaces = {
              notes = "~/Documents/Notes/neorg/",
            },
          },
        },
        ["core.norg.completion"] = {
          config = {
            engine = "nvim-cmp",
          }
        },
        ["core.integrations.treesitter"] = {},
      },
    },
    dependencies = { { "nvim-lua/plenary.nvim" } },
  },

  -- Syntax
  "numToStr/Comment.nvim",
  {
    "kylechui/nvim-surround",
    config = true,
  },
  {
    "norcalli/nvim-colorizer.lua",
    opts = '*';
  },

  -- Git
  "airblade/vim-gitgutter",
  {
    "TimUntersberger/neogit",
    config = true,
    keys = {
      { "<leader>gs", "<cmd>Neogit<cr>", desc = "Neogit" }
    }
  },

  -- tmux
  "preservim/vimux",
  "christoomey/vim-tmux-navigator",

  -- Utils
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "nvim-telescope/telescope.nvim",
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  "nvim-treesitter/playground",

  -- LSPZero
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  }
})
