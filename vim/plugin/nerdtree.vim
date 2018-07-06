" open NerdTree automatically when vim starts up if no file is specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" close vim if only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinSize=40
let g:NERDTreeInvalidBookmars = []
let NERDTreeIgnore=['\~$', '\.o$'. '\.so$', '\.a$', '\.lof', '\.lot', '\.toc', '\.gcda', '\.gcno', '\.gch', '\.pyc']
