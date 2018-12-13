" Use linter while saving file.
augroup goLint
  autocmd!
  set rtp+=~/go/src/golang.org/x/lint/misc/vim
  autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
augroup END
