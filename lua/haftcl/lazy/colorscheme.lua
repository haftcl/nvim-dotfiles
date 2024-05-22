function SetColors(color)
    color = color or "catppuccin"
    vim.cmd.colorscheme(color)
end

return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
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

            vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha
            SetColors()
        end
    },
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                style = "storm",
                terminal_colors = true,
            })
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup()
        end
    },
}
