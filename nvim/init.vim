"     _         _  __           _
"    (_)____   (_)/ /_  _   __ (_)____ ___
"   / // __ \ / // __/ | | / // // __ `__ \
"  / // / / // // /_ _ | |/ // // / / / / /
" /_//_/ /_//_/ \__/(_)|___//_//_/ /_/ /_/

let mapleader = "\<space>"

" Config files
source $HOME/.config/nvim/configuration/mappings.vim
source $HOME/.config/nvim/configuration/set.vim

" Plugin manager
source $HOME/.config/nvim/configuration/plug.vim

" Plugin config files
source $HOME/.config/nvim/plugins/line.lua
source $HOME/.config/nvim/plugins/telescope.vim
source $HOME/.config/nvim/plugins/treesitter.vim

" Italics are cringe
let g:gruvbox_material_disable_italic_comment = 1
let g:everforest_disable_italic_comment = 1
let g:sonokai_disable_italic_comment = 1
let g:edge_disable_italic_comment = 1
let g:gruvbox_italics = 0

" Everforest theme (soft, medium(default), hard)
" let g:everforest_background = 'hard'

" Sonokai theme (default, atlantis, andromeda, shusia, maia, espresso)
let g:sonokai_style = 'atlantis'

" Edge style (default, aura, neon)
let g:edge_style = 'neon'

" Colorscheme (gruvbox8[_hard/_soft], nord, gruvbox-material, sonokai, everforest, edge)
colorscheme everforest

" Netrw configuration
let g:netrw_altw = 1
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" Miscellaneous
au BufEnter * set fo-=c fo-=r fo-=o
filetype plugin on
syntax on

" Automatically delete all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
