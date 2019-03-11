let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20
" let g:netrw_list_hide= netrw_gitignore#Hide()
let g:netrw_list_hide ='\(^\|\s\s\)\zs\.\S\+'

augroup ProjectDrawer
" Open netrw file explorer when vim is opened with no argument
  autocmd!
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | :Vexplore | else | endif
augroup END
autocmd FileType netrw setl bufhidden=delete

" Change root of netrw tree <alt-o>
autocmd FileType netrw nnoremap <silent> <buffer> ø :call NetrwChangeRoot()<CR>

function NetrwChangeRoot()
  if isdirectory(expand("<cfile>")) | :execute "Ntree ".expand("<cfile>") | else | endif
endfunction

" Help Pages for vimscript
autocmd FileType vim nnoremap <buffer> K :call VimHelp()<CR>

function VimHelp()
  :execute "tab h ".expand("<cword>")
endfunction
