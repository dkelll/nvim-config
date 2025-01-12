-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- fuzzy finder
  use ("nvim-telescope/telescope.nvim")
  use("nvim-lua/plenary.nvim")
  use("ThePrimeagen/harpoon")
  use("ThePrimeagen/vim-be-good")

  -- statusline stuff
  use("nvim-lualine/lualine.nvim")

  -- LSP configs
  use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},

          -- Snippets
          {'L3MON4D3/LuaSnip'},
          {'rafamadriz/friendly-snippets'},
      }
  }

  -- colorschemes
  use("folke/tokyonight.nvim")
  use({"catppuccin/nvim", as = "catppuccin"})
  use({"rose-pine/neovim", as = "rose-pine"})
  use({"EdenEast/nightfox.nvim", as = "nightfox"})
  use("gruvbox-community/gruvbox")
  use("lunarvim/darkplus.nvim")

  -- treesitter fun, for highlighting and whatnot
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
  use("nvim-treesitter/playground")

  -- undo magics
  use("mbbill/undotree")

  -- git gud sun
  use("tpope/vim-fugitive")

  -- my attempt to sfdx with neovim (local package for now)
  use("/Users/david.kelly/Projects/plugins/sfdx.nvim")

end)
