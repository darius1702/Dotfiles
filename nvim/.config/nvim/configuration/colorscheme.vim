" Varius colorscheme settings

" Italics bad
let g:everforest_disable_italic_comment = 1
let g:gruvbox_italics = 0
let g:nord_italic = v:false
let g:kit_italic = "0"

" Probably something good
let g:everforest_better_performance = 1

" No sign column background
let g:everforest_sign_column_background = "NONE"

" Everforest theme (soft, medium(default), hard)
" let g:everforest_background = 'hard'

" This makes vim remember the colorscheme, so no explicit setting is needed
" <!> does not work with lualine for some reason <!>
" augroup restoreColorscheme
"     au!
"     autocmd ColorScheme * let g:PREVCOLOR = get (g:, "colors_name", "default")
"     autocmd BufWinEnter * ++once exe 'colorscheme ' . get(g:, "PREVCOLOR", "default")
" augroup END
