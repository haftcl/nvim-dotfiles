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
        harpoon = true,
        mason = true,
        neogit = true,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        notify = true,
    },
})

vim.cmd("colorscheme catppuccin")
