-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

------------------------------------------------------------------------
--                         builtin variables                          --
------------------------------------------------------------------------
vim.g.loaded_perl_provider = 0  -- Disable perl provider
vim.g.loaded_ruby_provider = 0  -- Disable ruby provider
vim.g.loaded_node_provider = 0  -- Disable node provider
vim.g.python3_host_prog = vim.fn.exepath("python3")

-- Custom mapping <leader> (see `:h mapleader` for more info)
-- vim.g.mapleader = ','

-- Use English as main language
vim.cmd [[language en_US.UTF-8]]

-- Disable loading certain plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Do not load the tutor plugin
vim.g.loaded_tutor_mode_plugin = 1
