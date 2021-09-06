" Fugitive
nnoremap <silent> <leader>gs :G<CR> " git status
nnoremap <silent> <leader>cc :G commit<CR> " git commit

" Tab for next buffer and shift+tab for previous buffer
nnoremap <silent> <TAB> :bnext<CR>
nnoremap <silent> <S-TAB> :bprevious<CR>

" Shortcutting split navigation, saving a keypress
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Telescope
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').file_browser(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags(require('telescope.themes').get_ivy({}))<cr>
nnoremap <leader>fm <cmd>lua require('telescope.builtin').man_pages(require('telescope.themes').get_ivy({}))<cr>

nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>/ <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>


" TeX
autocmd FileType tex inoremap <buffer> \\bi \begin{itemize}<CR>\end{itemize}<ESC>O\item
autocmd FileType tex inoremap <buffer> \\bf \begin{frame}<CR>\end{frame}<ESC>kf}a{}<ESC>ha
