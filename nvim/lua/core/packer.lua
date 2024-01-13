vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'airblade/vim-gitgutter'
  use 'vim-airline/vim-airline'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use {
    'nvim-telescope/telescope.nvim' ,
    tag = '0.1.3',
    requires = {
      { 'nvim-lua/plenary.nvim' },      -- required
      { 'nvim-tree/nvim-web-devicons' } -- optional
    }
  }
  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }
  use('ThePrimeagen/harpoon')
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- required
      { 'williamboman/mason.nvim' },           -- optional
      { 'williamboman/mason-lspconfig.nvim' }, -- optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },         -- required
      { 'hrsh7th/cmp-nvim-lsp' },     -- required
      { 'hrsh7th/cmp-buffer' },       -- optional
      { 'hrsh7th/cmp-path' },         -- optional
      { 'saadparwaiz1/cmp_luasnip' }, -- optional
      { 'hrsh7th/cmp-nvim-lua' },     -- optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' },             -- required
      { 'rafamadriz/friendly-snippets' }, -- optional
    }
  }
  use {
    "scalameta/nvim-metals",
    requires = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
  }
end)
