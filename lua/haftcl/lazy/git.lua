return {
    {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",         -- required
            "nvim-telescope/telescope.nvim", -- optional
            "sindrets/diffview.nvim",        -- optional
            "ibhagwan/fzf-lua",              -- optional
        },
        config = function()
            require('neogit').setup({
                integrations = {
                    diffview = true,
                },
            })

            local actions = require("diffview.actions")
            require("diffview").setup({
                diff_binaries = false, -- Show diffs for binaries
                enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
                git_cmd = { "git" }, -- The git executable followed by default args.
                use_icons = true, -- Requires nvim-web-devicons
                icons = {   -- Only applies when use_icons is true.
                    folder_closed = "",
                    folder_open = "",
                },
                signs = {
                    fold_closed = "",
                    fold_open = "",
                },
                file_panel = {
                    listing_style = "tree", -- One of 'list' or 'tree'
                    tree_options = {   -- Only applies when listing_style is 'tree'
                        flatten_dirs = true, -- Flatten dirs that only contain one single dir
                        folder_statuses = "only_folded", -- One of 'never', 'only_folded' or 'always'.
                    },
                    win_config = {     -- See ':h diffview-config-win_config'
                        position = "left",
                        width = 35,
                    },
                },
                file_history_panel = {
                    log_options = { -- See ':h diffview-config-log_options'
                        git = {
                            single_file = {
                                diff_merges = "combined",
                            },
                            multi_file = {
                                diff_merges = "first-parent",
                            },
                        }
                    },
                    win_config = { -- See ':h diffview-config-win_config'
                        position = "bottom",
                        height = 16,
                    },
                },
                commit_log_panel = {
                    win_config = {}, -- See ':h diffview-config-win_config'
                },
                default_args = { -- Default args prepended to the arg-list for the listed commands
                    DiffviewOpen = {},
                    DiffviewFileHistory = {},
                },
                hooks = {},   -- See ':h diffview-config-hooks'
                keymaps = {
                    disable_defaults = false, -- Disable the default keymaps
                    view = {
                        -- The `view` bindings are active in the diff buffers, only when the current
                        -- tabpage is a Diffview.
                        ["<tab>"]      = actions.select_next_entry, -- Open the diff for the next file
                        ["<s-tab>"]    = actions.select_prev_entry, -- Open the diff for the previous file
                        ["gf"]         = actions.goto_file, -- Open the file in a new split in the previous tabpage
                        ["<C-w><C-f>"] = actions.goto_file_split, -- Open the file in a new split
                        ["<C-w>gf"]    = actions.goto_file_tab, -- Open the file in a new tabpage
                        ["<leader>e"]  = actions.focus_files, -- Bring focus to the files panel
                        ["<leader>b"]  = actions.toggle_files, -- Toggle the files panel.
                    },
                    file_panel = {
                        ["j"]             = actions.next_entry, -- Bring the cursor to the next file entry
                        ["<down>"]        = actions.next_entry,
                        ["k"]             = actions.prev_entry, -- Bring the cursor to the previous file entry.
                        ["<up>"]          = actions.prev_entry,
                        ["<cr>"]          = actions.select_entry, -- Open the diff for the selected entry.
                        ["o"]             = actions.select_entry,
                        ["<2-LeftMouse>"] = actions.select_entry,
                        ["-"]             = actions.toggle_stage_entry, -- Stage / unstage the selected entry.
                        ["S"]             = actions.stage_all, -- Stage all entries.
                        ["U"]             = actions.unstage_all, -- Unstage all entries.
                        ["X"]             = actions.restore_entry, -- Restore entry to the state on the left side.
                        ["R"]             = actions.refresh_files, -- Update stats and entries in the file list.
                        ["L"]             = actions.open_commit_log, -- Open the commit log panel.
                        ["<c-b>"]         = actions.scroll_view(-0.25), -- Scroll the view up
                        ["<c-f>"]         = actions.scroll_view(0.25), -- Scroll the view down
                        ["<tab>"]         = actions.select_next_entry,
                        ["<s-tab>"]       = actions.select_prev_entry,
                        ["gf"]            = actions.goto_file,
                        ["<C-w><C-f>"]    = actions.goto_file_split,
                        ["<C-w>gf"]       = actions.goto_file_tab,
                        ["i"]             = actions.listing_style, -- Toggle between 'list' and 'tree' views
                        ["f"]             = actions.toggle_flatten_dirs, -- Flatten empty subdirectories in tree listing style.
                        ["<leader>e"]     = actions.focus_files,
                        ["<leader>b"]     = actions.toggle_files,
                    },
                    file_history_panel = {
                        ["g!"]            = actions.options, -- Open the option panel
                        ["<C-A-d>"]       = actions.open_in_diffview, -- Open the entry under the cursor in a diffview
                        ["y"]             = actions.copy_hash, -- Copy the commit hash of the entry under the cursor
                        ["L"]             = actions.open_commit_log,
                        ["zR"]            = actions.open_all_folds,
                        ["zM"]            = actions.close_all_folds,
                        ["j"]             = actions.next_entry,
                        ["<down>"]        = actions.next_entry,
                        ["k"]             = actions.prev_entry,
                        ["<up>"]          = actions.prev_entry,
                        ["<cr>"]          = actions.select_entry,
                        ["o"]             = actions.select_entry,
                        ["<2-LeftMouse>"] = actions.select_entry,
                        ["<c-b>"]         = actions.scroll_view(-0.25),
                        ["<c-f>"]         = actions.scroll_view(0.25),
                        ["<tab>"]         = actions.select_next_entry,
                        ["<s-tab>"]       = actions.select_prev_entry,
                        ["gf"]            = actions.goto_file,
                        ["<C-w><C-f>"]    = actions.goto_file_split,
                        ["<C-w>gf"]       = actions.goto_file_tab,
                        ["<leader>e"]     = actions.focus_files,
                        ["<leader>b"]     = actions.toggle_files,
                    },
                    option_panel = {
                        ["<tab>"] = actions.select_entry,
                        ["q"]     = actions.close,
                    },
                },
            })

            vim.keymap.set('n', '<leader>ng', "<cmd>Neogit<cr>", {})
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require('gitsigns').setup({
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']c', function()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, { expr = true })

                    map('n', '[c', function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, { expr = true })

                    -- Actions
                    map({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>')
                    map({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>')
                    map('n', '<leader>hS', gs.stage_buffer)
                    map('n', '<leader>hu', gs.undo_stage_hunk)
                    map('n', '<leader>hR', gs.reset_buffer)
                    map('n', '<leader>hp', gs.preview_hunk)
                    map('n', '<leader>hb', function() gs.blame_line { full = true } end)
                    map('n', '<leader>tb', gs.toggle_current_line_blame)
                    map('n', '<leader>hd', gs.diffthis)
                    map('n', '<leader>hD', function() gs.diffthis('~') end)
                    map('n', '<leader>td', gs.toggle_deleted)

                    -- Text object
                    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
                end
            })
        end
    }
}
