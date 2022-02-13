
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
" Color schemes
Plug 'sainnhe/gruvbox-material'     " gruvbox-material
Plug 'lifepillar/vim-gruvbox8'      " gruvbox8(_hard/_soft)
Plug 'sainnhe/everforest'           " everforest
Plug 'sainnhe/edge'                 " edge
Plug 'EdenEast/nightfox.nvim'       " (night/nord/day/dusk/dawn)fox
" LaTeX
Plug 'lervag/vimtex'
" Syntax
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" LSP
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Lualine
Plug 'nvim-lualine/lualine.nvim'
call plug#end()
