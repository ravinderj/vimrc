" Save and Quit keymap for vim
nnoremap ∑ :w<CR>
inoremap ∑ <ESC>:w<CR>
nnoremap œ :q<CR>
inoremap œ <ESC>:q<CR>

" Apply file's saved and unsaved buffer
nnoremap ® :windo e!<CR>

" Move line up/down
nnoremap Â :m -2<CR>
inoremap Â <ESC>:m -2<CR>
nnoremap µ :m +1<CR>
inoremap µ <ESC>:m +1<CR>

" Copy line
nnore ∂ :copy+0<CR>
inoremap ∂ <ESC>:copy +0<CR>

" Mappings for auto-completion of quotes/braces
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
