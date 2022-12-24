-- TODO
-- set localvimrc
-- ALE options
-- YouCompleteMe options
-- file-specific indents like Python
-- Colors -> use onedark colorschem and set onedark_terminal_italics=1 and airline_theme=onedark
--
-- Other configs to look into
-- https://github.com/glepnir/cosynvim/blob/main/lua/core/options.lua

local opt = vim.opt

opt.history = 1024
opt.shortmess:append "sI"
opt.mouse = 'a'

opt.updatetime = 100

opt.splitright = true
opt.splitbelow = true

opt.smarttab = true

-- Files
opt.autowrite = true
opt.autoread = true
opt.ff = 'unix'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'
opt.swapfile = false
-- Filetype plugin on?

opt.errorbells = true
opt.visualbell = true

-- Spaces and Tabs
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true
opt.shiftwidth = 2
opt.backspace = 'indent,eol,start'

opt.textwidth = 80
opt.colorcolumn= '80'

opt.number = true

opt.diffopt = 'filler,iwhite,internal,algorithm:patience'
opt.completeopt = 'menu,menuone,noselect'

opt.autoindent = true
opt.showtabline = 2

opt.ruler = true
opt.title = true

opt.hidden = true
opt.synmaxcol = 2500

opt.smartcase = true
opt.infercase = true
opt.incsearch = true -- searches as new characters entered
opt.hlsearch = true -- highlight searches
opt.ignorecase = true

vim.opt.termguicolors = true

if vim.loop.os_uname().sysname == 'Darwin' then
  vim.g.clipboard = {
    name = 'macOS-clipboard',
    copy = {
      ['+'] = 'pbcopy',
      ['*'] = 'pbcopy',
    },
    paste = {
      ['+'] = 'pbpaste',
      ['*'] = 'pbpaste',
    },
    cache_enabled = 0,
  }
  vim.g.python_host_prog = '/usr/bin/python'
  vim.g.python3_host_prog = '/usr/local/bin/python3'
end
