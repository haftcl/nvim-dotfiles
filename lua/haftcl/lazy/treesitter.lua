return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = "all", -- one of "all" or a list of languages
                ignore_install = { "" },  -- List of parsers to ignore installing
                sync_install = false,
                auto_install = false,
                modules = {},
                highlight = {
                    enable = true,       -- false will disable the whole extension
                    disable = { "css" }, -- list of language that will be disabled
                    additional_vim_regex_highlighting = { "php" }
                },
                autopairs = {
                    enable = true,
                },
                indent = { enable = true, disable = { "python", "css", "php" } },
                incremental_selection = {
                    enable = true,
                },
                textobjects = {
                    move = {
                        enable = true,
                        set_jumps = true, -- whether to set jumps in the jumplist
                        goto_next_start = {
                            ["]m"] = "@function.outer",
                            ["]]"] = "@class.outer",
                        },
                        goto_next_end = {
                            ["]M"] = "@function.outer",
                            ["]["] = "@class.outer",
                        },
                        goto_previous_start = {
                            ["[m"] = "@function.outer",
                            ["[["] = "@class.outer",
                        },
                        goto_previous_end = {
                            ["[M"] = "@function.outer",
                            ["[]"] = "@class.outer",
                        },
                    },
                },
            })
        end
    },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require 'treesitter-context'.setup {
                enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
                max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
                trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
                patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
                    -- For all filetypes
                    -- Note that setting an entry here replaces all other patterns for this entry.
                    -- By setting the 'default' entry below, you can control which nodes you want to
                    -- appear in the context window.
                    default = {
                        'class',
                        'function',
                        'method',
                        'for',
                        'while',
                        'if',
                        'switch',
                        'case',
                    },
                    -- Patterns for specific filetypes
                    -- If a pattern is missing, *open a PR* so everyone can benefit.
                    tex = {
                        'chapter',
                        'section',
                        'subsection',
                        'subsubsection',
                    },
                    rust = {
                        'impl_item',
                        'struct',
                        'enum',
                    },
                    scala = {
                        'object_definition',
                    },
                    vhdl = {
                        'process_statement',
                        'architecture_body',
                        'entity_declaration',
                    },
                    markdown = {
                        'section',
                    },
                    elixir = {
                        'anonymous_function',
                        'arguments',
                        'block',
                        'do_block',
                        'list',
                        'map',
                        'tuple',
                        'quoted_content',
                    },
                    json = {
                        'pair',
                    },
                    yaml = {
                        'block_mapping_pair',
                    },
                },
                exact_patterns = {
                    -- Example for a specific filetype with Lua patterns
                    -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
                    -- exactly match "impl_item" only)
                    -- rust = true,
                },

                -- [!] The options below are exposed but shouldn't require your attention,
                --     you can safely ignore them.

                zindex = 20, -- The Z-index of the context window
                mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
                -- Separator between context and content. Should be a single character string, like '-'.
                -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
                separator = nil,
            }
        end
    },
}
