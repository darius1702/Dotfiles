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

" Plugin manager
source $HOME/.config/nvim/configuration/plug.vim

" Plugin config files
source $HOME/.config/nvim/configuration/line.lua
source $HOME/.config/nvim/plugins/config.lua
source $HOME/.config/nvim/plugins/lsp_config.lua

colorscheme iceberg

" VimWiki
let g:vimwiki_list = [{'path': '~/Documents/Notes/vimwiki/'}]

" Vimtex
let g:vimtex_view_method = 'zathura'
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : 'build',
    \ }

" Vimux
let g:VimuxUseNearest = 0
let g:VimuxPromptString = "Run: "

" Netrw configuration
let g:netrw_altw = 1
let g:netrw_liststyle = 3
let g:netrw_banner = 0

" Miscellaneous
au BufEnter * set fo-=c fo-=r fo-=o
filetype plugin on
syntax enable

" Automatically delete all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
