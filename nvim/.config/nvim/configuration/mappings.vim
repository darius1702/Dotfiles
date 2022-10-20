" The better auto-pairs
inoremap <silent> {<CR> {<CR><CR><BS>}<ESC>ka<TAB>

" Shift + J/K moves selected lines down/up in visual mode
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <silent> <leader>p "+p
xnoremap <silent> <leader>p "_dP

nnoremap <silent> <leader>y "+y
vnoremap <silent> <leader>y "+y

nnoremap <silent> <leader>d "_d
vnoremap <silent> <leader>d "_d

" Fugitive
" git status
nnoremap <silent> <leader>gs :G<CR>
" git commit
nnoremap <silent> <leader>cc :G commit<CR>

" Vimux
nnoremap <silent> <leader>vp :VimuxPromptCommand<CR>
nnoremap <silent> <leader>vl :VimuxRunLastCommand<CR>
nnoremap <silent> <leader>vc :VimuxCloseRunner<CR>
nnoremap <silent> <leader>vz :VimuxZoomRunner<CR>
nnoremap <silent> <leader>vi :VimuxInterruptRunner<CR>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>/ <cmd>Telescope current_buffer_fuzzy_find<cr>

" TeX
autocmd FileType tex inoremap <buffer> \\bi \begin{itemize}<CR>\end{itemize}<ESC>O\item
autocmd FileType tex inoremap <buffer> \\bf \begin{frame}<CR>\end{frame}<ESC>kf}a{}<ESC>ha

" Haskell
autocmd FileType haskell nnoremap <buffer> <leader>hl :!hlint %<CR>
autocmd FileType haskell nnoremap <buffer> <leader>hi :!hindent %<CR><CR>

" Markdown
autocmd FileType markdown nnoremap <buffer> <leader>cb 0f[lrx
