local function map(mode, l, r, opts)
	opts = opts or {}
	opts.buffer = bufnr
	vim.keymap.set(mode, l, r, opts)
end

map('n', '<leader><space>', ':nohl<CR>')

map('n', '<F2>', ':set invpaste paste?<CR>')
vim.opt.pastetoggle = '<F2>'

-- Plugin shortcuts

--map('n', '<leader>r', ':NvimTreeToggle<CR>')            -- open/close
map('n', 'bn', ':NvimTreeFindFileToggle<CR>')            -- open/close
--map('n', '<leader>bn', ':NvimTreeFindFileToggle<CR>')            -- open/close
--map('n', '<leader>rn', ':NvimTreeFindFileToggle<CR>')            -- open/close

map('n', '<leader>t', ':TagbarToggle<CR>')
