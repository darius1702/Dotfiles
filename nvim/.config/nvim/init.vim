"     _         _  __           _
"    (_)____   (_)/ /_  _   __ (_)____ ___
"   / // __ \ / // __/ | | / // // __ `__ \
"  / // / / // // /_ _ | |/ // // / / / / /
" /_//_/ /_//_/ \__/(_)|___//_//_/ /_/ /_/

let mapleader = "\<space>"

" Config files
source $HOME/.config/nvim/configuration/mappings.vim
source $HOME/.config/nvim/configuration/set.vim
source $HOME/.config/nvim/configuration/colorscheme.vim
source $HOME/.config/nvim/configuration/line.vim

" Plugin manager
source $HOME/.config/nvim/configuration/plug.vim

" Plugin config files
source $HOME/.config/nvim/plugins/config.lua
source $HOME/.config/nvim/plugins/lsp_config.lua

" Vimux
let g:VimuxUseNearest = 0
let g:VimuxPromptString = "Run: "

" Hardtime
let g:hardtime_default_on = 1
let g:hardtime_maxcount = 3
let g:list_of_disabled_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]

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
