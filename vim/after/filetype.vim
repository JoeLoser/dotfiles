if exists("did_load_filetypes")
    finish
endif

" To enable all features for a particular file type
" See http://vim.wikia.com/wiki/Filetype.vim
set nocompatible
set filetype indent plugin on
if !exists("g:syntax_on")
    syntax enable
endif

augroup filetype_detect
    autocmd!
    au Bufread *.uml set ft=plantuml
    au Bufread *.plantuml set ft=plantuml
augroup END

augroup git
    autocmd!
    " Commit messages should not be longer than 72 characters wide
    autocmd FileType gitcommit textwidth=72
augroup END
