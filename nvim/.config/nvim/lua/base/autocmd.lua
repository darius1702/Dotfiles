-- Automatically delete all trailing whitespace on save
vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])

vim.cmd([[autocmd FileType tex set spell]])
vim.cmd([[ autocmd FileType tex inoremap <buffer> \\bi \begin{itemize}<CR>\end{itemize}<ESC>O\item ]])
vim.cmd([[autocmd FileType tex inoremap <buffer> \\bf \begin{frame}<CR>\end{frame}<ESC>kf}a{}<ESC>ha]])
