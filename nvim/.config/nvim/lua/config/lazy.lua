local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)require("lazy").setup({

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

  -- Statusline
  "nvim-lualine/lualine.nvim",

  -- Ros
  "tadachs/mutils.nvim",
  {
    'darius1702/ros-nvim',
    config = function() require("ros-nvim").setup({only_workspace = true}) end,
    dependencies = { "tadachs/mutils.nvim" },
  },

  -- LaTeX
  "lervag/vimtex",

  -- Autopairs
  {
    "windwp/nvim-autopairs",
    config = function() require('nvim-autopairs').setup{} end,
  },

  -- Neorg
  {
    "nvim-neorg/neorg",
    lazy = true,
    build = ":Neorg sync-parsers",
    opts = {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.norg.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = "~/Documents/Notes/neorg/",
            },
          },
        },
        -- ["core.norg.concealer"] = {
        --   config = {
        --     folds = false,
        --   },
        -- },
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
  config = function() require('nvim-surround').setup{} end,
},
{
  "norcalli/nvim-colorizer.lua",
  config = function() require('colorizer').setup{
    '*'; -- highlight in all files
  } end,
},

-- Git
"airblade/vim-gitgutter",
{
  "TimUntersberger/neogit",
  config = function() require('neogit').setup{} end,
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



