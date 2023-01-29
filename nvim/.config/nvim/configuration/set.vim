autocmd FileType tex set spell
set spelllang=de_de,en_us

if has('termguicolors')
    set termguicolors
endif
set bg=dark
set scrolloff=3
set matchpairs+=<:>
set signcolumn=yes
set path+=**

if !has('gui_running')
  set t_Co=256
endif

set noshowmode
set laststatus=2 " 1 for no statusline
" set showtabline=2 " 1 for only when more than 1 tab is open
" set noruler
set noshowcmd
set cmdheight=1

set encoding=utf-8
set number relativenumber
set splitbelow splitright

set langmenu=en_US
set expandtab
set shiftwidth=2
set softtabstop=4
set autoindent smartindent breakindent
set hidden
set nobackup
set nowritebackup
set updatetime=50
set go=a
set mouse=a
set nohlsearch
set ignorecase
set nocompatible

" Persistent undo
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=1000
set undoreload=10000
