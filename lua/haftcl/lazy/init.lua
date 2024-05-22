return {
    {
        "nvim-lua/plenary.nvim",
        name = "plenary",
    },
    {"eandrju/cellular-automaton.nvim"},
    "kyazdani42/nvim-web-devicons",
    "rcarriga/nvim-notify",
    {
        'tamton-aquib/duck.nvim',
        config = function()
            local duck = require("duck")
            vim.keymap.set('n', '<leader>dh', function () duck.hatch() end, {})
            vim.keymap.set('n', '<leader>dk', function () duck.cook() end, {})
        end,
        event = "VeryLazy",
    }
}
