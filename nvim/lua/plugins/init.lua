local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print('Installing packer. Please close and reopen Neovim.')
  vim.cmd [[packadd packer.nvim]]
end

-- Automatically run :PackerCompile whenever plugins.lua is updated
--vim.cmd([[
  --augroup packer_user_config
    --autocmd!
    --autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  --augroup end
--]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'navarasu/onedark.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'vim-airline/vim-airline'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    config = function()
      require('plugins.configs.treesitter')
    end
  }

  -- LSP
  use {
    'neovim/nvim-lspconfig', -- Collection of configurations for built-in LSP client
    config = function()
      require('plugins.configs.lsp')
    end
  }
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
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'onsails/lspkind.nvim'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-vsnip'

  use 'mfussenegger/nvim-lint' -- Linter

  -- TODO: adjust mappings to be like <leader>cc with nerdcommenter?
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

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
    config = function()
      -- TODO: use file_ignore_patterns to ignore .git and third-party code.
      -- For now, am just using a local .rgignore file.
      require('telescope').setup()
    end
  }
  -- To get fzf loaded and working with telescope, you need to call
  -- -- load_extension, somewhere after setup function:
  require('telescope').load_extension('fzf')

  --use 'preservim/nerdtree'

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
    config = function()
      require('nvim-tree').setup()
    end
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

  --use {
    --'lewis6991/gitsigns.nvim',
     --tag = 'release',
     --config = function()
      --require('gitsigns').setup()
     --end
  --}

  use 'tpope/vim-fugitive'

  use 'preservim/tagbar'

  --use {
    --'akinsho/bufferline.nvim',
     --tag = "v2.*",
     --requires = 'kyazdani42/nvim-web-devicons',
     --config = function()
       --require('bufferline').setup()
     --end
  --}

  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup()
    end
  }

  use 'instant-markdown/vim-instant-markdown'

  -- Automatically set up configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
