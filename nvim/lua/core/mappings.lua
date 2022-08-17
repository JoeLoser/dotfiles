local function map(mode, l, r, opts)
	opts = opts or {}
	opts.buffer = bufnr
	vim.keymap.set(mode, l, r, opts)
end

map('n', '<leader><space>', ':nohl<CR>')

map('n', '<F2>', ':set invpaste paste?<CR>')
vim.opt.pastetoggle = '<F2>'

-- Plugin shortcuts

map('n', 'bn', ':NvimTreeToggle<CR>')            -- open/close
map('n', 'rn', ':NvimTreeToggle<CR>')            -- open/close

map('n', '<leader>f', ':Telescope find_files<CR>')
map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>b', ':Telescope buffers<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')

map('n', '<leader>t', ':TagbarToggle<CR>')
