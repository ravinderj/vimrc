" Save and Quit keymap for vim
" Alt+w, Alt+q
nnoremap ∑ :w<CR>
inoremap ∑ <ESC>:w<CR>
nnoremap œ :q<CR>
inoremap œ <ESC>:q<CR>

" Apply file's saved and unsaved buffer
nnoremap ® :windo e!<CR>

" Move line up/down
" Alt+M. Alt+m
nnoremap Â :m -2<CR>
inoremap Â <ESC>:m -2<CR>
nnoremap µ :m +1<CR>
inoremap µ <ESC>:m +1<CR>

" Copy line
" Alt+d
nnore ∂ :copy+0<CR>
inoremap ∂ <ESC>:copy +0<CR>

" Resize splits
" (Alt,-), (Alt,=), (Alt,_), (Alt,+)
nnoremap – :vertical resize -2<CR>
nnoremap ≠ :vertical resize +2<CR>
nnoremap — :resize -2<CR>
nnoremap ± :resize +2<CR>

" Pane switching
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Tab switching
" Alt+h, Alt+l
nnoremap ˙ gT
nnoremap ¬ gt

autocmd FileType netrw nnoremap <buffer> <silent> o :call OpenInNewTab()<CR>

function OpenInNewTab()
  if !isdirectory(expand("<cfile>")) | :execute "normal! \<C-w>gf" | else | :execute "normal \<CR>" | endif
endfunction
