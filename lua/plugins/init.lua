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
    open_fn = function ()
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
  use { 'folke/tokyonight.nvim' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'kyazdani42/nvim-tree.lua' }
  use { 'lewis6991/gitsigns.nvim' }
  use { 'akinsho/bufferline.nvim', tag = 'v2.*', requires = 'kyazdani42/nvim-web-devicons' }
  use { 'goolord/alpha-nvim' }
  use { 'numToStr/Comment.nvim' }
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use { 'akinsho/toggleterm.nvim', tag = 'v2.*' }

  -- cmp plugins
  use { 'hrsh7th/nvim-cmp', commit = 'df6734aa018d6feb4d76ba6bda94b1aeac2b378a' } -- The completion plugin
  use { 'hrsh7th/cmp-buffer', commit = '62fc67a2b0205136bc3e312664624ba2ab4a9323' } -- buffer completions
  use { 'hrsh7th/cmp-path', commit = '466b6b8270f7ba89abd59f402c73f63c7331ff6e' } -- path completions
  use { 'saadparwaiz1/cmp_luasnip', commit = 'a9de941bcbda508d0a45d28ae366bb3f08db2e36' } -- snippet completions
  use { 'hrsh7th/cmp-nvim-lsp', commit = 'affe808a5c56b71630f17aa7c38e15c59fd648a8' }
  use { 'hrsh7th/cmp-nvim-lua', commit = 'd276254e7198ab7d00f117e88e223b4bd8c02d21' }

  -- snippets
  use { 'L3MON4D3/LuaSnip', commit = '79b2019c68a2ff5ae4d732d50746c901dd45603a' } --snippet engine
  use { 'rafamadriz/friendly-snippets', commit = 'd27a83a363e61009278b6598703a763ce9c8e617' } -- a bunch of snippets to use

  -- Lsp
  use { 'williamboman/mason.nvim' } -- Installation of lsp, dap, linter and formatter
  use { 'williamboman/mason-lspconfig.nvim' } -- Integration of mason with lspconfig
  use { 'neovim/nvim-lspconfig' } -- Lsp server integration
  use { 'jose-elias-alvarez/null-ls.nvim' } -- For linting and formatting

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter' }

  -- Otros
  use {
    'kylechui/nvim-surround',
    tag = '*', -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require('nvim-surround').setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  }

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
  require 'plugins.configs.bufferline'
  require 'plugins.configs.alpha'
  require 'plugins.configs.comment'
  require 'plugins.configs.neogit'
  require 'plugins.configs.diffview'
  require 'plugins.lsp'
end)
