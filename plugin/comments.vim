function IsCommented(commentor, index)
  return strcharpart(getline('.'), 0, a:index) == a:commentor
endfunction

" Comment/Uncomment
function Comment(commentor, index)
  if ! IsCommented(a:commentor, a:index)
    execute "normal! mz"
    execute "silent :s@^@".a:commentor." @"
    normal! `z
  else
    execute "normal! mz"
    execute "silent :s@^".a:commentor." \\?@@"
    normal! `z
  endif
endfunction

augroup vimComment
  autocmd!
  autocmd fileType * nnoremap <silent> gcc :call Comment("//", 2)<CR>
  autocmd fileType * vnoremap <silent> gcc :call Comment("//", 2)<CR>
  autocmd fileType vim nnoremap <silent> gcc :call Comment("\"", 1)<CR>
  autocmd fileType vim vnoremap <silent> gcc :call Comment("\"", 1)<CR>
  autocmd fileType zsh nnoremap <silent> gcc :call Comment("#", 1)<CR>
  autocmd fileType zsh vnoremap <silent> gcc :call Comment("#", 1)<CR>
  autocmd fileType sh nnoremap <silent> gcc :call Comment("#", 1)<CR>
  autocmd fileType sh vnoremap <silent> gcc :call Comment("#", 1)<CR>
augroup END
