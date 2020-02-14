" Use linter while saving file. (set GOLINT env_var)
augroup goLint
  autocmd!
  set rtp+=~/go/src/golang.org/x/lint/misc/vim
  autocmd BufWritePost,FileWritePost *.go call RunGoLint()
augroup END

function RunGoLint()
  if exists("$GOLINT") | execute 'Lint' | cwindow | else | endif
endfunction
