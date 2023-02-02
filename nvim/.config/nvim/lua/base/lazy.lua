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
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Colors
	"cocopon/iceberg.vim",

	-- Statusline
	"nvim-lualine/lualine.nvim",

	-- LaTeX
	"lervag/vimtex",

	-- Autopairs
	"windwp/nvim-autopairs",

	-- Neorg
	"nvim-neorg/neorg",

	-- Syntax
	"tpope/vim-commentary",
	"tpope/vim-surround",
	"norcalli/nvim-colorizer.lua",

	-- Git
	"airblade/vim-gitgutter",
	"TimUntersberger/neogit",

	-- tmux
	"preservim/vimux",
	"christoomey/vim-tmux-navigator",

	-- Utils
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",
	"nvim-telescope/telescope.nvim",
	{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

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



