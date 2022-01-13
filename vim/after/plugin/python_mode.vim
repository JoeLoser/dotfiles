let g:pymode = 1
let g:pymode_python = "python3"
let g:pymode_rope = 0
let g:pymode_lint_checkers=['pep8']
let g:pymode_lint_cwindow = 0
"let g:pymode_options_max_line_length = "88"
let g:pymode_run_bind =  '<leader>rp'
let g:pymode_breakpoint = 0
" TODO: parse out .flake8 file from git repo to get the options in reality
let g:pymode_lint_options_pep8 = {
  \ 'max_line_length': 88,
  \ 'ignore': "W503,E203,E231",
  \ 'exclude': ['.git', '.direnv', 'build', 'vendor']
  \}
