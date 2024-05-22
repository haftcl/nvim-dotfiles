return {
    "github/copilot.vim",
    config = function ()
        vim.keymap.set('i', '<C-g>', "copilot#Accept(\"\")", { noremap = true, silent = true, expr = true, script = true })
        vim.g.copilot_no_tab_map = 1
    end
}
