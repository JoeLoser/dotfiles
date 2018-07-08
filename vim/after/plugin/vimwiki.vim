let g:vimwiki_dir_link = 'index'
let g:vimwiki_use_calendar = 1
" TODO: consider using mardown instead of html
" TODO: consider using multiple wikis (such as personal.wiki, tech.wiki)
" TODO: specify nested_syntaxes for cpp, sh, etc
let g:vimwiki_list = [{
  \ 'path': '~/vimwiki',
  \ 'syntax': 'markdown',
  \ 'template_path': '~/vimwiki/templates/',
  \ 'template_default': 'default',
  \ 'template_ext': '.html',
  \ 'path_html': '~/vimwiki/site_html'}]
let g:vimwiki_hl_cb_checked = 1 " highlight completed tasks
let g:vimwiki_hl_headers = 1 " highlight headers with different colors
au BufRead,BufNewFile *.wiki set filetype=vimwiki

" vimwiki decided to use d for this keymap, but I use dd often to kill
" lines...
let VimwikiMakeDiaryNote='<Leader>mdn'
:nmap <Leader>dn <Plug>VimwikiMakeDiaryNote
