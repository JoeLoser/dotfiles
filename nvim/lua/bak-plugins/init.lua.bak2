local plugins = {
	"navarasu/onedark.nvim",
	-- TODO: revisit these in future
	-- 'nvim-lua/plenary.nvim',

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		event = "BufEnter",
		run = ":TSUpdate",
		config = [[require('plugins.configs.treesitter')]],
	},

	-- LSP
	{ "onsails/lspkind-nvim", event = "VimEnter" },

	-- auto-completion engine
	{ "hrsh7th/nvim-cmp", after = "lspkind-nvim", config = [[require('plugins.configs.nvim-cmp')]] },

	"SmiteshP/nvim-navic",
	"ray-x/lsp_signature.nvim", -- Show function signature when you type

	"hrsh7th/vim-vsnip", -- TODO: do we need this still?

	-- nvim-cmp completion sources
	{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
	{ "hrsh7th/cmp-path", after = "nvim-cmp" },
	{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
	{ "hrsh7th/cmp-emoji", after = "nvim-cmp" },

	"mfussenegger/nvim-lint", -- Linter

	-- nvim-lsp configuration (it relies on cmp-nvim-lsp, so it should be loaded after cmp-nvim-lsp).
	--{ "neovim/nvim-lspconfig", after = "cmp-nvim-lsp", config = [[require('plugins.configs.lsp')]] },

	{ "joechrisellis/lsp-format-modifications.nvim" },

	{
		"numToStr/Comment.nvim",
		config = [[require('plugins.configs.comment')]],
	},

	{
		"preservim/nerdcommenter",
	},

	{
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	},

	-- TODO: move to confi,
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = {
			{ "nvim-lua/popup.nvim", opt = true },
			{ "nvim-lua/plenary.nvim", opt = true },
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		},
		pickers = {
			find_files = {
				hidden = true,
			},
		},
		config = [[require("plugins.configs.telescope")]],
	},

	-- search emoji and other symbols
	{ "nvim-telescope/telescope-symbols.nvim", after = "telescope.nvim" },

	-- Icons
	{ "kyazdani42/nvim-web-devicons", event = "VimEnter" },

	{
		"akinsho/bufferline.nvim",
		event = "VimEnter",
		cond = firenvim_not_active,
		config = [[require('plugins.configs.bufferline')]],
	},

	-- notification plugin
	{
		"rcarriga/nvim-notify",
		event = "BufEnter",
		config = function()
			vim.defer_fn(function()
				require("plugins.configs.nvim-notify")
			end, 2000)
		end,
	},

	-- better UI for some nvim actions
	{ "stevearc/dressing.nvim" },

	-- Show undo history visually
	{ "simnalamburt/vim-mundo", cmd = { "MundoToggle", "MundoShow" } },

	{
		"max397574/better-escape.nvim",
		event = { "InsertEnter" },
		opts = {},
	},

	-- File explorer
	{
		"kyazdani42/nvim-tree.lua",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		branch = "master", -- optional, updated every week. (see issue #1193)
		config = [[require("plugins.configs.nvim-tree")]],
	},

	{
		"feline-nvim/feline.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},

	-- Dashboard (start screen)
	{
		"goolord/alpha-nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},

	{ "tpope/vim-fugitive" },
	-- Better git log display
	{ "rbong/vim-flog", dependencies = "tpope/vim-fugitive", cmd = { "Flog" } },

	-- Show git change (change, delete, add) signs in vim sign column
	{ "lewis6991/gitsigns.nvim", config = [[require('plugins.configs.gitsigns')]] },

	-- Better git commit experience
	{ "rhysd/committia.vim", setup = [[vim.cmd('packadd committia.vim')]] },

	"preservim/tagbar",

	-- {
	--   'folke/which-key.nvim',
	--   config = function()
	--       vim.defer_fn(function()
	--         require("plugins.configs.which-key")
	--       end, 2000)
	--   end,
	-- },

	"instant-markdown/vim-instant-markdown",
	{ "rhysd/vim-grammarous", ft = { "markdown" } },

	{
		"ggandor/leap.nvim",
		config = [[require("plugins.configs.leap")]],
	},

	-- The missing auto-completion for cmdline!
	{ "gelguy/wilder.nvim", opt = true, setup = [[vim.cmd('packadd wilder.nvim')]] },

	-- show and trim trailing whitespaces
	{ "jdhao/whitespace.nvim", event = "VimEnter" },
}

return plugins
