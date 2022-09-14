local map = vim.api.nvim_set_keymap

-- Normal --
-- map leader key to Space
map('n', '<Space>', '', {})
vim.g.mapleader = ' '

local opts = { noremap = true, silent = true }

-- Keep search matches in the middle of the window
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)

-- YY/XX Copy/Cut into the system clipboard
vim.cmd([[
noremap YY "+y<CR>
noremap XX "+x<CR>
]])

-- Clear matches with Ctrl+h
map('n', '<C-h>', ':noh<Cr>', opts)

-- Telescope mappings
map('n', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>', opts)
map('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').git_files()<cr>', opts)
map('n', '<leader>fs', '<cmd>lua require(\'telescope.builtin\').lsp_document_symbols()<cr>', opts)
map('n', '<leader>fw', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', opts)
map('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>', opts)
map('n', '<leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>', opts)
map('n', '<leader>fc', '<cmd>lua require(\'telescope.builtin\').git_commits()<cr>', opts)
map('n', '<leader>ft', '<cmd>lua require(\'telescope.builtin\').git_status()<cr>', opts)
map('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').git_branch()<cr>', opts)
map('n', '<leader>fo', ':Telescope file_browser<cr>', opts)
map('n', '<leader>fp', ":lua require'telescope'.extensions.project.project{}<CR>", opts)

-- Barbar -- Buffers
map('n', '<leader>ba', '<cmd>BufferCloseAllButCurrent<cr>', opts)
map('n', '<leader>bc', '<cmd>BufferClose<cr>', opts)
map('n', '<S-h>', '<cmd>BufferPrevious<CR>', opts)
map('n', '<S-l>', '<cmd>BufferNext<CR>', opts)

-- Neogit
map('n', '<leader>ng', "<cmd>Neogit<cr>", opts)

-- Visual --
-- Stay in indent mode
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- QqWw as the same
vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Qa', 'qa', {})
vim.api.nvim_create_user_command('Q', 'q', {})

-- Toggleterm
function _G.set_terminal_keymaps()
  local lopts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], lopts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], lopts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
