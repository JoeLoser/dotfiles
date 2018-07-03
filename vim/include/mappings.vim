" Navigation

" TODO: better tab navigation

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

" Plugins
map bn :NERDTreeToggle<CR>
" view current buffer in NerdTree
map <leader>r :NERDTreeFind<cr>

" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

" vim-airline to use ,digit to select tab
nmap ,1 <Plug>AirlineSelectTab1
nmap ,2 <Plug>AirlineSelectTab2
nmap ,3 <Plug>AirlineSelectTab3
nmap ,4 <Plug>AirlineSelectTab4
nmap ,5 <Plug>AirlineSelectTab5
nmap ,6 <Plug>AirlineSelectTab6
nmap ,7 <Plug>AirlineSelectTab7
nmap ,8 <Plug>AirlineSelectTab8
nmap ,9 <Plug>AirlineSelectTab9

" vimwiki decided to use d for this keymap, but I use dd often to kill
" lines...
let VimwikiMakeDiaryNote='<Leader>mdn'

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
