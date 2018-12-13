set runtimepath+=~/.my_vim_runtime

set number
set wildmenu
set ruler
set hlsearch
set incsearch
syntax on
filetype plugin indent on
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set foldmethod=indent " folding
set foldnestmax=10   " fold anything with a max nest level of 10
set backspace=indent,eol,start
set laststatus=2
set nowrap
set clipboard=unnamed
set updatetime=100
set belloff=all
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%#HLname#
set statusline+=\ %f
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %p%%
set statusline+=\ %l:%c
highlight StatusLine ctermbg=white ctermfg=60
highlight LineNr ctermfg=250 ctermbg=236
highlight VertSplit ctermbg=white ctermfg=black
highlight QuickFixLine ctermbg = None
highlight QuickFixLine ctermfg = Red

" Maintain undo history between sessions
set undodir=~/.my_vim_runtime/temp_dirs/undodir
set undofile

" Avoid creating swap files
" set noswapfile

" Set directory for swapfiles
set directory^=~/.my_vim_runtime/temp_dirs/swapdir//

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RemoveFancyCharacters COMMAND
" Remove smart quotes, etc.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RemoveFancyCharacters()
    let typo = {}
    let typo["“"] = '"'
    let typo["”"] = '"'
    let typo["‘"] = "'"
    let typo["’"] = "'"
    let typo["–"] = '--'
    let typo["—"] = '---'
    let typo["…"] = '...'
    :exe ":%s/".join(keys(typo), '\|').'/\=typo[submatch(0)]/ge'
endfunction
command! RemoveFancyCharacters :call RemoveFancyCharacters()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OpenChangedFiles COMMAND
" Open a split for each dirty file in git
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! OpenChangedFiles()
  only " Close all windows, unless they're modified
  let status = system('git status -s | grep "^ \?\(M\|A\|UU\)" | sed "s/^.\{3\}//"')
  let filenames = split(status, "\n")
  exec "edit ".filenames[0]
  for filename in filenames[1:]
    exec "sp ".filename
  endfor
endfunction
command! OpenChangedFiles :call OpenChangedFiles()
