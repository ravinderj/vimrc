" Using shellcheck for linting of code.
if executable("shellcheck")
  augroup shellLinter
    autocmd!
    setlocal makeprg=shellcheck\ -f\ gcc\ %
    autocmd BufWritePost * if &makeprg == "shellcheck -f gcc %" | :silent make | redraw! | else | endif
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost    l* nested lwindow
  augroup END
  highlight QuickFixLine ctermbg = None
  highlight QuickFixLine ctermfg = Red
endif

