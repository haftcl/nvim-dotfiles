return {
    {
        "nvim-telescope/telescope.nvim",
        branch = '0.1.x',
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")

            telescope.setup({
                extensions = {
                    file_browser = {
                        hijack_netrw = true,
                    },
                    project = {
                        hidden_files = false, -- default: false
                        theme = "dropdown"
                    },
                }
            })

            vim.keymap.set('n', '<leader>ff', function () builtin.find_files({ hidden = true }) end)
            vim.keymap.set('n', '<leader>fg', builtin.git_files)
            vim.keymap.set('n', '<leader>fw', builtin.live_grep)
            vim.keymap.set('n', '<leader>fb', builtin.buffers)
            vim.keymap.set('n', '<leader>fh', builtin.help_tags)
            vim.keymap.set('n', '<leader>fc', builtin.git_commits)
        end
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            local telescope = require("telescope")
            telescope.load_extension "file_browser"
            vim.keymap.set('n', '<leader>fo', function () telescope.extensions.file_browser.file_browser() end)
        end
    },
    {
        "nvim-telescope/telescope-project.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function ()
            local telescope = require("telescope")
            telescope.load_extension "project"
            vim.keymap.set('n', '<leader>fp', function () telescope.extensions.project.project({}) end)
        end
    },
}
