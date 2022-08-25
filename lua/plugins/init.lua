-- Inicializamos packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  print 'Cloning packer ...'
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected require call (pcall) so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  },
})

return packer.startup(function(use)
  -- Mis plugins
  -- General
  use { 'wbthomason/packer.nvim' } -- Let packer manage itself
  use { 'nvim-lua/plenary.nvim' }
  use { 'lewis6991/impatient.nvim' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'kyazdani42/nvim-tree.lua' }
  use { 'lewis6991/gitsigns.nvim' }
  use {
    'romgrk/barbar.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }
  use { 'goolord/alpha-nvim' }
  use { 'numToStr/Comment.nvim' } use { 'JoosepAlviste/nvim-ts-context-commentstring' }
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use { 'akinsho/toggleterm.nvim', tag = 'v2.*' }

  -- Colorschemes
  use { 'olimorris/onedarkpro.nvim' }
  use { 'folke/tokyonight.nvim' }

  -- cmp plugins
  use { 'hrsh7th/nvim-cmp' } -- The completion plugin
  use { 'hrsh7th/cmp-buffer' } -- buffer completions
  use { 'hrsh7th/cmp-path' } -- path completions
  use { 'saadparwaiz1/cmp_luasnip' } -- snippet completions
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-nvim-lua' }

  -- snippets
  use { 'L3MON4D3/LuaSnip' } --snippet engine
  use { 'rafamadriz/friendly-snippets' } -- a bunch of snippets to use

  -- Lsp
  use { 'williamboman/mason.nvim' } -- Installation of lsp, dap, linter and formatter
  use { 'williamboman/mason-lspconfig.nvim' } -- Integration of mason with lspconfig
  use { 'neovim/nvim-lspconfig' } -- Lsp server integration
  use { 'jose-elias-alvarez/null-ls.nvim' } -- For linting and formatting

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter' }

  -- Movement and Actions
  use {
    'kylechui/nvim-surround',
    tag = '*', -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require('nvim-surround').setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  }
  use { 'tpope/vim-repeat' }
  use { 'ggandor/lightspeed.nvim' }

  if packer_bootstrap then
    require('packer').sync()
  end

  require 'plugins.configs.impatient'
  require 'plugins.configs.lualine'
  require 'plugins.configs.mason'
  require 'plugins.configs.nvimtree'
  require 'plugins.configs.treesitter'
  require 'plugins.configs.toggleterm'
  require 'plugins.configs.gitsigns'
  require 'plugins.configs.cmp'
  require 'plugins.configs.null-ls'
  require 'plugins.configs.barbar'
  require 'plugins.configs.alpha'
  require 'plugins.configs.comment'
  require 'plugins.configs.neogit'
  require 'plugins.configs.diffview'
  require 'plugins.lsp'
end)
