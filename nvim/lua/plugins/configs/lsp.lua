--local vim = vim
--local nvim_lsp = require('lspconfig')

---- Setup nvim-cmp.
--local cmp = require('cmp')

--vim.cmd([[
--set shortmess+=c
--]])

--local opts = { noremap=true, silent=true }


--local on_attach = function(client, bufnr)
    --vim.g.completion_matching_strategy_list = "['exact', 'substring', 'fuzzy']"

		--local navic = require('nvim-navic')
    --navic.attach(client, bufnr)

    --local function buf_set_keymap(...)
        --vim.api.nvim_buf_set_keymap(bufnr, ...)
    --end

    --local function buf_set_option(...)
        --vim.api.nvim_buf_set_option(bufnr, ...)
    --end

    ---- Enable completion triggered by <c-x><c-o>
    --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    ---- Mappings.
    --local opts = { noremap = true, silent = true }

    ---- See `:help vim.lsp.*` for documentation on any of the below functions
    --buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    --buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    --buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    --buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    --buf_set_keymap('n', '<leader>,', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    --buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    --buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    --buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    --buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    --buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    --buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    --buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    --buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    --buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format { async = true }<CR>', opts)
    --buf_set_keymap('n', '<space>e', '<cmd> lua vim.diagnostic.open_float()<CR>', opts)
    --buf_set_keymap('n', '[d', '<cmd> lua vim.diagnostic.goto_prev()<CR>', opts)
    --buf_set_keymap('n', ']d', '<cmd> lua vim.diagnostic.goto_next()<CR>', opts)
    --buf_set_keymap('n', '<leader>q', '<cmd> lua vim.diagnostic.setloclist()<CR>', opts)
--end

---- Setup Completion
---- See https://github.com/hrsh7th/nvim-cmp#basic-configuration
--cmp.setup({
    ---- Enable LSP snippets
    --snippet = {
        --expand = function(args)
            --vim.fn["vsnip#anonymous"](args.body)
        --end,
    --},
    --mapping = {
        --['<C-p>'] = cmp.mapping.select_prev_item(),
        --['<C-n>'] = cmp.mapping.select_next_item(),
        ---- Add tab support
        --['<S-Tab>'] = cmp.mapping.select_prev_item(),
        --['<CR>'] = cmp.mapping.select_next_item(),
        --['<C-d>'] = cmp.mapping.scroll_docs(-4),
        --['<C-f>'] = cmp.mapping.scroll_docs(4),
        --['<C-Space>'] = cmp.mapping.complete(),
        --['<C-e>'] = cmp.mapping.close(),
        --['<Tab>'] = cmp.mapping.confirm({
            --behavior = cmp.ConfirmBehavior.Insert,
            --select = true,
        --})
    --},

    ---- Installed sources
    --sources = {
        --{ name = 'nvim_lsp' },
        --{ name = 'nvim_lua' },
        --{ name = 'path' },
        --{ name = 'buffer', keyword_length = 4 },
        --{ name = 'vsnip' },
    --},
--})

---- Setup lspconfig.
--local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

--require('lspconfig').clangd.setup {
		--capabilities = capabilities,
		--on_attach = on_attach,
    --cmd = {
        --"clangd",
        --"--background-index",
        --"--header-insertion=iwyu",
        --"--query-driver=/usr/local/Cellar/llvm/14.0.6_1/bin/clang++"
    --}
--}

--require('lspconfig').pylsp.setup {
		--on_attach = on_attach,
		--flags = {
				--debounce_text_changes = 150,
		--},
		--capabilities = capabilities,

		---- For further configuration: https://github.com/python-lsp/python-lsp-server/blob/develop/CONFIGURATION.md
		--settings = {
				--formatCommand = {"black"},
				--pylsp = {
						--plugins = {
								--black = { enabled = true, line_length = 80 },
								--flake8 = { enabled = true, indentSize = 4 },
								--pyls_isort = { enabled = true },
								--pyflakes = { enabled = true },
								--pycodestyle = { enabled = false },
								--pylint = { enabled = true, executable = "pylint" },
						--},
				--},
		--},
--}

--require('lspconfig').pyright.setup {
		--cmd = { 'pyright-langserver', '--stdio' },
		--capabilities = capabilities,
		--on_attach = on_attach,
		--flags = { debounce_text_changes = 150 },
		--settings = {
				--pyright = {
						--autoImportCompletions = true,
						--typeCheckingMode = 'basic',
						--useLibraryCodeForTypes = true,
				--}
		--}
--}

--require('lspconfig').sumneko_lua.setup {
		--cmd = { 'lua-language-server' },
		--capabilities = capabilities,
		--on_attach = on_attach
--}

--require('lspconfig').bashls.setup {
		--cmd = { 'bash-language-server', 'start' },
		--single_file_support = true,
		--capabilities = capabilities,
		--on_attach = on_attach
--}

--require('lint').linters_by_ft = {
    --cmake = { 'cmakelint' },
    --sh = { 'shellcheck' },
--}

--vim.api.nvim_create_autocmd({'BufWritePre'}, {
    --pattern = {"*.cpp", "*.hpp", "*.h", "*.c", "*.py", "*.cmake", "*.CMakeLists.txt"},
    --callback = vim.lsp.buf.formatting,
--})
