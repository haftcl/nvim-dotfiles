-- Inicializamos packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = false

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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.api.nvim_create_autocmd("BufWritePost", {
  group = vim.api.nvim_create_augroup("packer_user_config", { clear = true }),
  pattern = "*/nvim/lua/plugins/init.lua",
  callback = function()
    vim.api.nvim_command('source <afile>');
    require('packer').compile()
  end
})

return packer.startup(function(use)
  -- Mis plugins
  -- General
  use { 'wbthomason/packer.nvim' } -- Let packer manage itself
  use { 'nvim-lua/plenary.nvim' }
  use { 'lewis6991/impatient.nvim' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-telescope/telescope-file-browser.nvim' }
  use { 'nvim-telescope/telescope-project.nvim' }
  use { 'nvim-telescope/telescope-ui-select.nvim' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'numToStr/Comment.nvim' }
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }
  use { 'akinsho/toggleterm.nvim', tag = 'v2.*' }
  use { 'NvChad/nvim-colorizer.lua' } -- Colorizer buffer based
  use { 'lukas-reineke/indent-blankline.nvim' }
  use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    requires = {'nvim-tree/nvim-web-devicons'}
  }

  -- Git
  use { 'lewis6991/gitsigns.nvim' }
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  -- Colorschemes
  use { 'folke/tokyonight.nvim' }
  use { "catppuccin/nvim", as = "catppuccin", run = ":CatppuccinCompile" }
  use { "EdenEast/nightfox.nvim" }

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
  use { 'neovim/nvim-lspconfig', tag = '*' } -- Lsp server integration
  use { 'jose-elias-alvarez/null-ls.nvim' } -- For linting and formatting

  -- Golang
  use { 'ray-x/go.nvim', requires = 'ray-x/guihua.lua', config = function() require 'go'.setup() end }

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }
  use { 'nvim-treesitter/nvim-treesitter-context' }

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

  -- Others
  use {
    'tamton-aquib/duck.nvim',
    config = function ()
      vim.keymap.set('n', '<leader>dh', function () require("duck").hatch() end, {})
      vim.keymap.set('n', '<leader>dk', function () require("duck").cook() end, {})
    end
  }

  if packer_bootstrap then
    packer.sync()
  end

  require 'plugins.configs.impatient'
  require 'plugins.configs.lualine'
  require 'plugins.configs.mason'
  require 'plugins.configs.treesitter'
  require 'plugins.configs.telescope'
  require 'plugins.configs.toggleterm'
  require 'plugins.configs.gitsigns'
  require 'plugins.configs.cmp'
  require 'plugins.configs.null-ls'
  require 'plugins.configs.dashboard'
  require 'plugins.configs.comment'
  require 'plugins.configs.neogit'
  require 'plugins.configs.diffview'
  require 'plugins.configs.colorizers'
  require 'plugins.configs.indent'
  require 'plugins.lsp'
end)
