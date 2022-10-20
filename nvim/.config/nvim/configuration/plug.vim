if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')

" Color schemes
Plug 'sainnhe/everforest'
Plug 'tadachs/kit.vim'
Plug 'shaunsingh/nord.nvim'
Plug 'navarasu/onedark.nvim'

" Statusline
Plug 'nvim-lualine/lualine.nvim'

" Hardtime
Plug 'takac/vim-hardtime'

" LaTeX
Plug 'lervag/vimtex'

" VimWiki
Plug 'vimwiki/vimwiki'

" Syntax
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'norcalli/nvim-colorizer.lua'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" tmux
Plug 'preservim/vimux'
Plug 'christoomey/vim-tmux-navigator'

" LSP
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

call plug#end()
