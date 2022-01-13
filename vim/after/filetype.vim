" Include guard to avoid this getting sourced multiple times
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
    au BufWritePost *.feature set ft=cucumber
augroup END

augroup git
    " Commit messages should not be longer than 80 characters wide
    autocmd! FileType gitcommit textwidth=80
augroup END

augroup format_features
    autocmd! FileType cucumber map <Tab> :Tabularize /\|<CR>
augroup END
