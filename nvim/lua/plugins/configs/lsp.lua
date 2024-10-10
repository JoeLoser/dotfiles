local vim = vim
local nvim_lsp = require("lspconfig")

-- Setup nvim-cmp.
local cmp = require("cmp")

vim.cmd([[
set shortmess+=c
]])

local on_attach = function(client, bufnr)
	vim.g.completion_matching_strategy_list = "['exact', 'substring', 'fuzzy']"

	local navic = require("nvim-navic")
	if client.server_capabilities.documentSymbolProvider then
		navic.attach(client, bufnr)
	end

	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	if client.server_capabilities.documentRangeFormattingProvider then
		local lsp_format_modifications = require("lsp-format-modifications")
		lsp_format_modifications.attach(client, bufnr, { format_on_save = true })
	end

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<leader>,", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	buf_set_keymap("n", "<leader>gf", "<cmd>lua vim.lsp.buf.format { async = true }<CR>", opts)
	buf_set_keymap("n", "<space>e", "<cmd> lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap("n", "[d", "<cmd> lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "]d", "<cmd> lua vim.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<leader>q", "<cmd> lua vim.diagnostic.setloclist()<CR>", opts)
end

-- cmp.setup({
-- 	snippet = {
-- 		-- REQUIRED - you must specify a snippet engine
-- 		expand = function(args)
-- 			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
-- 			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
-- 			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
-- 			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
-- 			-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
-- 		end,
-- 	},
-- 	window = {
-- 		-- completion = cmp.config.window.bordered(),
-- 		-- documentation = cmp.config.window.bordered(),
-- 	},
-- 	mapping = cmp.mapping.preset.insert({
-- 		["<C-b>"] = cmp.mapping.scroll_docs(-4),
-- 		["<C-f>"] = cmp.mapping.scroll_docs(4),
-- 		["<C-Space>"] = cmp.mapping.complete(),
-- 		["<C-e>"] = cmp.mapping.abort(),
-- 		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
-- 	}),
-- 	sources = cmp.config.sources({
-- 		{ name = "nvim_lsp" },
-- 		{ name = "vsnip" }, -- For vsnip users.
-- 		-- { name = 'luasnip' }, -- For luasnip users.
-- 		-- { name = 'ultisnips' }, -- For ultisnips users.
-- 		-- { name = 'snippy' }, -- For snippy users.
-- 	}, {
-- 		{ name = "buffer" },
-- 	}),
-- })

-- cmp.setup({
-- 	snippet = {
-- 		expand = function(args)
-- 			vim.fn["vsnip#anonymous"](args.body)
-- 		end,
-- 	},
-- 	mapping = {
-- 		["<C-p>"] = cmp.mapping.select_prev_item(),
-- 		["<C-n>"] = cmp.mapping.select_next_item(),
-- 		["<C-d>"] = cmp.mapping.scroll_docs(-4),
-- 		["<C-f>"] = cmp.mapping.scroll_docs(4),
-- 		["<C-Space>"] = cmp.mapping.complete(),
-- 		["<C-e>"] = cmp.mapping.close(),
-- 		["<CR>"] = cmp.mapping.confirm({
-- 			behavior = cmp.ConfirmBehavior.Replace,
-- 			select = true,
-- 		}),
-- 		["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
-- 		["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
-- 	},
--formatting = {
--    format = function(_, vim_item)
--       vim.cmd("packadd lspkind-nvim")
--       vim_item.kind = require("lspkind").presets.codicons[vim_item.kind]
--       .. "  "
--       .. vim_item.kind
--       return vim_item
--    end,
-- },
-- 	sources = {
-- 		{ name = "nvim_lsp" },
-- 		{ name = "vsnip" },
-- 		{ name = "path" },
-- 	},
-- })

-- vim.cmd([[
-- 	augroup NvimCmp
-- 	au!
-- 	au FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
-- 	augroup END
-- ]])

-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig").clangd.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--limit-results=0",
		"--completion-style",
		"detailed",
		"--all-scopes-completion",
		"--pch-storage=memory",
		"-j=8",
		"--ranking-model=decision_forest",
		"--header-insertion=never",
	},
})

-- require('lspconfig').cmake.setup {
--   on_attach = on_attach,
--   initializationOptions = {
--     {
--       buildDirectory = ".derived/build"
--     }
--   }
-- }

require("lspconfig").pylsp.setup({
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
	},
	capabilities = capabilities,

	-- For further configuration: https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
	settings = {
		-- formatCommand = {"black"},
		pylsp = {
			plugins = {
				black = { enabled = true, line_length = 80 },
				flake8 = { enabled = true, indentSize = 4, maxLineLength = 80 },
				pyls_isort = { enabled = true },
				pyflakes = { enabled = true },
				pycodestyle = { enabled = false },
				pylint = { enabled = true, executable = "pylint" },
			},
		},
	},
})

require("lspconfig").pyright.setup({
	cmd = { "pyright-langserver", "--stdio" },
	capabilities = capabilities,
	on_attach = on_attach,
	flags = { debounce_text_changes = 150 },
	settings = {
		pyright = {
			autoImportCompletions = true,
			typeCheckingMode = "basic",
			useLibraryCodeForTypes = true,
		},
	},
})

-- require('lspconfig').sumneko_lua.setup {
--     cmd = { 'lua-language-server' },
--     capabilities = capabilities,
--     on_attach = on_attach
-- }

require("lspconfig").bashls.setup({
	cmd = { "bash-language-server", "start" },
	single_file_support = true,
	capabilities = capabilities,
	on_attach = on_attach,
})

require("lint").linters_by_ft = {
	cmake = { "cmakelint" },
	sh = { "shellcheck" },
}

-- vim.api.nvim_create_autocmd({'BufWritePre'}, {
--     pattern = {"*.cpp", "*.hpp", "*.h", "*.c", "*.py", "*.cmake", "*.CMakeLists.txt"},
--     callback = function()
--         vim.lsp.buf.format()
--     end
-- })
