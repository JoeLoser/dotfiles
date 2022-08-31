let g:ycm_clangd_uses_ycmd_caching = 0
let g:ycm_clangd_binary_path = trim(system('brew --prefix llvm')).'/bin/clangd'
let g:ycm_clangd_args = ['-log=verbose', '-pretty']

nnoremap <leader>gl :YcmCompleter GetType<CR>
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gc :YcmCompleter GoToReferences<CR>
