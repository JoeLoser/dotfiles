vim.g.base46_cache = vim.fn.stdpath("data") .. "/nvchad/base46/"
vim.g.mapleader = " "

--
require("config.lazy")

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require("core")
require("core.options")
--require "nvchad.autocmds"
require("core.mappings")
require("core.globals")
--require("plugins")
require("lspconfig").mojo.setup({})

-- require('onedark').load()
