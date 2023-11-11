local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected require call (pcall) so we don't error out on first use
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  return
end

lazy.setup({
  -- General
  'wbthomason/packer.nvim',
  'nvim-lua/plenary.nvim',
  'lewis6991/impatient.nvim',
  'kyazdani42/nvim-web-devicons',
  'rcarriga/nvim-notify',
  { 'github/copilot.vim' },
  -- Telescope
  'nvim-telescope/telescope.nvim',
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  },
  'nvim-telescope/telescope-file-browser.nvim',
  'nvim-telescope/telescope-project.nvim',
  'nvim-telescope/telescope-ui-select.nvim',
  'nvim-lualine/lualine.nvim',
  'numToStr/Comment.nvim',
  'JoosepAlviste/nvim-ts-context-commentstring',
  {
    'akinsho/toggleterm.nvim',
    version = "*"
  },
  'NvChad/nvim-colorizer.lua',
  'lukas-reineke/indent-blankline.nvim',
  'ThePrimeagen/harpoon',
  -- Git
  'lewis6991/gitsigns.nvim',
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
      "ibhagwan/fzf-lua",              -- optional
    }
  },
  -- Colorschemes
  { 'folke/tokyonight.nvim' },
  { "EdenEast/nightfox.nvim" },
  { "catppuccin/nvim",       name = "catppuccin", priority = 1000 },
  -- cmp plugins
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'saadparwaiz1/cmp_luasnip',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-nvim-lua',
  -- snippets
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp"
  },
  'rafamadriz/friendly-snippets',          -- a bunch of snippets to use
  -- Lsp
  { 'williamboman/mason.nvim' },           -- Installation of lsp, dap, linter and formatter
  { 'williamboman/mason-lspconfig.nvim' }, -- Integration of mason with lspconfig
  { 'neovim/nvim-lspconfig' },             -- Lsp server integration
  { 'jose-elias-alvarez/null-ls.nvim' },   -- For linting and formatting
  -- Treesitter
  { 'nvim-treesitter/nvim-treesitter' },
  { 'nvim-treesitter/nvim-treesitter-textobjects' },
  { 'nvim-treesitter/nvim-treesitter-context' },
  -- Golang
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  -- Movement and Actions
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },
  { 'tpope/vim-repeat' },
  -- Others
  {
    'tamton-aquib/duck.nvim',
    config = function()
      vim.keymap.set('n', '<leader>dh', function() require("duck").hatch() end, {})
      vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
    end
  }
})

require 'plugins.configs.impatient'
require 'plugins.configs.lualine'
require 'plugins.configs.mason'
require 'plugins.configs.treesitter'
require 'plugins.configs.telescope'
require 'plugins.configs.toggleterm'
require 'plugins.configs.gitsigns'
require 'plugins.configs.cmp'
require 'plugins.configs.null-ls'
require 'plugins.configs.comment'
require 'plugins.configs.neogit'
require 'plugins.configs.diffview'
require 'plugins.configs.colorizers'
require 'plugins.configs.indent'
require 'plugins.lsp'
