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
source $HOME/.config/nvim/plugins/telescope.lua
source $HOME/.config/nvim/plugins/treesitter.vim

" Italics bad
let g:gruvbox_material_disable_italic_comment = 1
let g:everforest_disable_italic_comment = 1
let g:sonokai_disable_italic_comment = 1
let g:edge_disable_italic_comment = 1
let g:gruvbox_italics = 0

" Probably something good
let g:everforest_better_performance = 1
let g:sonokai_better_performance = 1
let g:edge_better_performance = 1
let g:gruvbox_material_better_performance = 1

" No sign column background
let g:everforest_sign_column_background = 'none'
let g:sonokai_sign_column_background = 'none'
let g:edge_sign_column_background = 'none'
let g:gruvbox_material_sign_column_background = 'none'

" Everforest theme (soft, medium(default), hard)
" let g:everforest_background = 'hard'

" Sonokai theme (default, atlantis, andromeda, shusia, maia, espresso)
let g:sonokai_style = 'maia'

" Edge style (default, aura, neon)
let g:edge_style = 'default'

" Colorscheme (gruvbox8[_hard/_soft], nord, gruvbox-material, sonokai, everforest, edge, catppuccin)
" This makes vim remember the colorscheme, so no explicit setting is needed
augroup restoreColorscheme
    au!
    autocmd ColorScheme * let g:PREVCOLOR = get (g:, "colors_name", "default")
    autocmd BufWinEnter * ++once exe 'colorscheme ' . get(g:, "PREVCOLOR", "default")
augroup END

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
