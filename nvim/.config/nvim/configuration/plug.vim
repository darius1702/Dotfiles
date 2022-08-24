if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
" Color schemes
Plug 'sainnhe/everforest'
Plug 'tadachs/kit.vim'
Plug 'shaunsingh/nord.nvim'
" Statusline
Plug 'nvim-lualine/lualine.nvim'
" Hardtime
Plug 'takac/vim-hardtime'
" LaTeX
Plug 'lervag/vimtex'
" Syntax
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" tmux
Plug 'preservim/vimux'
" LSP
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
call plug#end()
