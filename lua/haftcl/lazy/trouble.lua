return {
    "folke/trouble.nvim",
    branch = "dev",
    keys = {
        {
            "<leader>tt",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)",
        },
    },
    config = function()
        require("trouble").setup {}
    end
}
