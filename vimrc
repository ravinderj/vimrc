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
hi StatusLine ctermbg=white ctermfg=60
hi LineNr ctermfg=250 ctermbg=236
hi VertSplit ctermbg=white ctermfg=black

" Maintain undo history between sessions
set undodir=~/.my_vim_runtime/temp_dirs/undodir
set undofile

" Avoid creating swap files
" set noswapfile

" Set directory for swapfiles
set directory^=~/.my_vim_runtime/temp_dirs/swapdir//
