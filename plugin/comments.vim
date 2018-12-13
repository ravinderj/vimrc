function IsCommented(commentInitial, commentEnd)
"   will be true if line has both commentInitial and commentEnd present
  let commentInitialPresent = match(getline('.'),'^\M'.a:commentInitial) != -1
"   commentEndPresent will be true if commentEnd is ''
  let commentEndPresent = match(getline('.'),'\M'.a:commentEnd.'$') != -1
  return commentInitialPresent && commentEndPresent
endfunction

" Comment/Uncomment
function Comment()
"   comment out the line if not already commented else uncomment
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
"   map Comment/Uncomment to keystroke 'gcc'
  autocmd!
  autocmd fileType * nnoremap <silent> gcc :call Comment()<CR>
  autocmd fileType * vnoremap <silent> gcc :call Comment()<CR>
augroup END

" TODO:
" Comment should start with the first non-space character in line.
" Either comment or uncomment at a time.
