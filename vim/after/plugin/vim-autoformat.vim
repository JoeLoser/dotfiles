"au BufWrite CMakeLists.txt :Autoformat
"au BufWrite *.cmake :Autoformat
"au BufWrite *.py :Autoformat

" Don't fallback to vim indent for autoformat
"let g:autoformat_autoindent = 0
"let g:autoformat_retab = 0
"let g:autoformat_remove_trailing_spaces = 0
"let g:autoformat_verbosemode=0

" Custom formatter for cmake
"let g:formatdef_cmake_format = '"cmake-format"'
"let g:autoformat_verbosemode=1
"let g:formatdef_ts_cmake_format='"/usr/local/bin/cmake-format -i --config-file /home/jloser/projects/ts/.gitlab-ci/cmake-format.cfg"'
"let g:formatters_cmake=['cmake_format']

" Because setting formatters_python to black doesn't quite work...
"autocmd BufWritePre *.py execute ':Black'
"let g:formatters_python = ['black']
