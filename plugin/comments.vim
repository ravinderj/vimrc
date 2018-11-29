function IsCommented(commentInitial, commentEnd)
  let commentInitialPresent = match(getline('.'),'^\M'.a:commentInitial) != -1
  let commentEndPresent = match(getline('.'),'\M'.a:commentEnd.'$') != -1
  return commentInitialPresent && commentEndPresent
endfunction

" Comment/Uncomment
function Comment()
  let commentInitial = get(split(&commentstring, ' \?%s'),0)
  let commentEnd = get(split(&commentstring, ' \?%s'),1,'')
  if ! IsCommented(commentInitial, commentEnd)
    execute "normal! mz"
    execute "silent :s@.*@".commentInitial." &".commentEnd."@"
    normal! `z
  else
    execute "normal! mz"
    execute "silent :s@\\M".commentInitial." \\?@@ "." | silent :s@\\M".commentEnd."$@@"
    normal! `z
  endif
endfunction

augroup vimComment
  autocmd!
  autocmd fileType * nnoremap <silent> gcc :call Comment()<CR>
  autocmd fileType * vnoremap <silent> gcc :call Comment()<CR>
augroup END
