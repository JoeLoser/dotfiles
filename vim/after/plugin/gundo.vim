" gundo tries to use python 2.4 even if vim has python3 support, so tell it to
" use python3 explicitly
if has('python3')
    let g:gundo_prefer_python3 = 1
endif
nnoremap <F5> :GundoToggle<CR>
