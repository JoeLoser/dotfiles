if v:version < 800
    echoerr 'Not using vim with async, so use default ALE options'
    finish
endif

set updatetime=1000
let g:ale_lint_on_text_changed = 0
autocmd CursorHold * call ale#Lint()
autocmd CursorHoldI * call ale#Lint()
autocmd InsertEnter * call ale#Lint()
autocmd InsertLeave * call ale#Lint()
