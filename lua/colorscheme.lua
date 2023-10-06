-- Tokyonight
--[[ vim.g.tokyonight_style = "night" ]]
--
--[[ vim.cmd("colorscheme tokyonight") ]]

-- Catppuccin
vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

require("catppuccin").setup({
  compile = {
    enabled = true,
  },
  integrations = {
    neogit = true,
    indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
  }
})

vim.cmd("colorscheme catppuccin")
