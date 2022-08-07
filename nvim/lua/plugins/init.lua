local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print('Installing packer. Please close and reopen Neovim.')
  vim.cmd [[packadd packer.nvim]]
end

-- Automatically run :PackerCompile whenever plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

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
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'mfussenegger/nvim-lint' -- Linter

  --use {
    --'neoclide/coc.nvim',
    --branch = 'release'
  --}


  use {
    'preservim/nerdcommenter',
    config = function()
      require('plugins.configs.nerdcommenter')
    end
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = {
      { 'nvim-lua/popup.nvim', opt = true },
      { 'nvim-lua/plenary.nvim', opt = true },
      { 'nvim-telescope/telescope-fzy-native.nvim', opt = true },
    },
    config = function()
      require('telescope').setup()
    end
  }

	use {
		'phaazon/hop.nvim',
		branch = 'v2', -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
		end
	}



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

	use {
		'lewis6991/gitsigns.nvim',
		 tag = 'release',
		 config = function()
			require('gitsigns').setup()
     end
	}

  use {
    'akinsho/bufferline.nvim',
     tag = "v2.*",
     requires = 'kyazdani42/nvim-web-devicons',
     config = function()
       require('bufferline').setup()
     end
  }

  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup()
    end
  }

  -- Automatically set up confgiuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
