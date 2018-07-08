" Normal mode
" ------------
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
nnoremap Y y$
" whenever type %, jump to matching object AND visually select all text in between
noremap % v%

" Select entire buffer
nnoremap vaa ggvGg_

" Close files
nnoremap <silent> <leader>qq :q<CR>

" Insert mode
" ------------
inoremap jk <ESC>
inoremap jj <ESC>
inoremap kj <ESC>
inoremap JK <ESC>
inoremap JJ <ESC>
inoremap KJ <ESC>

" Visual mode
" ------------
 " Automatically jump to end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" General commands that should probably be somewhere else
" TODO:
command! W  :w
command! Q  :q
command! WQ :wq
command! Wq :wq
command! Wa :wa
command! WA :wa
command! QW :qw
command! Qa :qa
command! AW :aw
