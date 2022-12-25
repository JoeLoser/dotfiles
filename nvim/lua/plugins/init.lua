local fn = vim.fn

-- The root dir to install all plugins. Plugins are under opt/ or start/ sub-directory.
vim.g.plugin_home = fn.stdpath("data") .. "/site/pack/packer"

--- Install packer if it has not been installed.
--- Return:
--- true: if this is a fresh install of packer
--- false: if packer has been installed
local function packer_ensure_install()
  -- Where to install packer.nvim -- the package manager (we make it opt)
  local packer_dir = vim.g.plugin_home .. "/opt/packer.nvim"

  if fn.glob(packer_dir) ~= "" then
    return false
  end

  -- Auto-install packer in case it hasn't been installed.
  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})

  local packer_repo = "https://github.com/wbthomason/packer.nvim"
  local install_cmd = string.format("!git clone --depth=1 %s %s", packer_repo, packer_dir)
  vim.cmd(install_cmd)

  return true
end

local fresh_install = packer_ensure_install()

-- Automatically run :PackerCompile whenever plugins.lua is updated
--vim.cmd([[
  --augroup packer_user_config
    --autocmd!
    --autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  --augroup end
--]])

return require('packer').startup(function(use)
  -- it is recommended to put impatient.nvim before any other plugins
  use { "lewis6991/impatient.nvim", config = [[require('impatient')]] }
  use 'wbthomason/packer.nvim'
  use 'navarasu/onedark.nvim'
  -- TODO: revisit these in future
  use 'nvim-lua/plenary.nvim'

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    event = "BufEnter",
    run = ":TSUpdate",
    config = [[require('plugins.configs.treesitter')]],
  }

  -- LSP
  use { "onsails/lspkind-nvim", event = "VimEnter" }

  -- auto-completion engine
  use { "hrsh7th/nvim-cmp", after = "lspkind-nvim", config = [[require('plugins.configs.nvim-cmp')]] }

  use {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end
  }
  use {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup()
    end
  }
  use 'SmiteshP/nvim-navic'
  use 'ray-x/lsp_signature.nvim' -- Show function signature when you type

  use 'hrsh7th/vim-vsnip' -- TODO: do we need this still?

  -- nvim-cmp completion sources
  use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
  use { "hrsh7th/cmp-path", after = "nvim-cmp" }
  use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
  use { "hrsh7th/cmp-emoji", after = "nvim-cmp" }

  use 'mfussenegger/nvim-lint' -- Linter

  -- nvim-lsp configuration (it relies on cmp-nvim-lsp, so it should be loaded after cmp-nvim-lsp).
  use { "neovim/nvim-lspconfig", after = "cmp-nvim-lsp", config = [[require('plugins.configs.lsp')]] }
  use 'joechrisellis/lsp-format-modifications.nvim'

  use {
    'numToStr/Comment.nvim',
    config = [[require('plugins.configs.comment')]]
  }

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

  -- TODO: move to config
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = {
      { 'nvim-lua/popup.nvim', opt = true },
      { 'nvim-lua/plenary.nvim', opt = true },
    },
		extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
      }
    },
    pickers = {
      find_files = {
        hidden = true
      },
    },
    config = [[require("plugins.configs.telescope")]]
  }

  -- search emoji and other symbols
  use { "nvim-telescope/telescope-symbols.nvim", after = "telescope.nvim" }

  -- Icons
  use { "kyazdani42/nvim-web-devicons", event = "VimEnter" }

  use { "akinsho/bufferline.nvim", event = "VimEnter",
      cond = firenvim_not_active,
      config = [[require('plugins.configs.bufferline')]]
  }

   -- notification plugin
  use {
    "rcarriga/nvim-notify",
    event = "BufEnter",
    config = function()
      vim.defer_fn(function()
        require("plugins.configs.nvim-notify")
      end, 2000)
    end,
  }

  -- better UI for some nvim actions
  use {'stevearc/dressing.nvim'}

  -- Show undo history visually
  use { "simnalamburt/vim-mundo", cmd = { "MundoToggle", "MundoShow" } }

  use { "max397574/better-escape.nvim", event = { "InsertEnter" },
    config = function()
      require("better_escape").setup()
    end,
  }

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    config = [[require("plugins.configs.nvim-tree")]]
  }

  use {
    'feline-nvim/feline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- Dashboard (start screen)
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  use { "tpope/vim-fugitive" }
  -- Better git log display
  use { "rbong/vim-flog", requires = "tpope/vim-fugitive", cmd = { "Flog" } }

  -- Show git change (change, delete, add) signs in vim sign column
  use { "lewis6991/gitsigns.nvim", config = [[require('plugins.configs.gitsigns')]] }

  -- Better git commit experience
  use { "rhysd/committia.vim", setup = [[vim.cmd('packadd committia.vim')]] }

  use 'preservim/tagbar'

  use {
    'folke/which-key.nvim',
    config = function()
        vim.defer_fn(function()
          require("plugins.configs.which-key")
        end, 2000)
    end,
  }

  use 'instant-markdown/vim-instant-markdown'
  use { "rhysd/vim-grammarous", ft = { "markdown" } }

  use {
    'ggandor/leap.nvim',
    config = [[require("plugins.configs.leap")]]
  }

  -- The missing auto-completion for cmdline!
  use { "gelguy/wilder.nvim", opt = true, setup = [[vim.cmd('packadd wilder.nvim')]] }

  -- show and trim trailing whitespaces
  use { "jdhao/whitespace.nvim", event = "VimEnter" }

  -- use {
  --   'mfussenegger/nvim-dap',
  --   config = function()
  --     require('plugins.configs.dap')
  --   end
  -- }
  -- use {
  --   'theHamsta/nvim-dap-virtual-text',
  --   config = function()
  --     require("nvim-dap-virtual-text").setup()
  --   end
  -- }
  -- use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

  -- Automatically set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
