return require('packer').startup(function()
  use  { 'wbthomason/packer.nvim' }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'
  use { 'neovim/nvim-lspconfig', config = function() 
    require 'plugins.nvim-lspconfig'
  end }

  use { 'hrsh7th/nvim-compe', config = function() 
	  require 'plugins.nvim-compe'
  end }

  -- Debugger
  use { 'mfussenegger/nvim-dap', config = function()
      require 'plugins.nvim-dap'
  end }
  -- fzf
  use {'junegunn/fzf', run = 'fzf#install()' }
  use 'junegunn/fzf.vim'
  -- terescope 
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
      config = function() require 'plugins.telescope' end
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use {'nvim-telescope/telescope-dap.nvim' }
  -- Vim dispatch
  use { 'tpope/vim-dispatch' }
  -- Fugitive for Git
  use { 'tpope/vim-fugitive' }
  -- Seamless tmux navigation
  use 'christoomey/vim-tmux-navigator'
  -- Color scheme
  use { 
        'marko-cerovac/material.nvim',
        config = function()
            vim.g.material_style = 'deep ocean'
            require'material'.set()
        end
    }
 -- plz help me key bind
 use {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}
-- file explorer and icons
-- " requires
 use 'kyazdani42/nvim-web-devicons' 
 use'kyazdani42/nvim-tree.lua'
end)
-- https://github.com/tomaskallup/dotfiles/tree/master/nvim/lua/plugins
