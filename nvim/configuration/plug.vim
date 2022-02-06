
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
" Color schemes
Plug 'sainnhe/gruvbox-material'     " gruvbox-material
Plug 'lifepillar/vim-gruvbox8'      " gruvbox8(_hard/_soft)
Plug 'arcticicestudio/nord-vim'     " nord
Plug 'sainnhe/everforest'           " everforest
Plug 'sainnhe/edge'                 " edge
Plug 'catppuccin/nvim', {'as': 'catppuccin'}                 " edge
"LaTeX
Plug 'lervag/vimtex'
" Syntax
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'aklt/plantuml-syntax'
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
