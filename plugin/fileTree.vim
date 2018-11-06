let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * if argc() == 0 | :Vexplore | else | endif
augroup END
autocmd FileType netrw setl bufhidden=delete
