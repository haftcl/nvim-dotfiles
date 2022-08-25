local map = vim.api.nvim_set_keymap

-- Normal -- 
-- map leader key to Space
map('n', '<Space>', '', {})
vim.g.mapleader = ' '

local opts = { noremap=true, silent=true }

-- Keep search matches in the middle of the window
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)

-- YY/XX Copy/Cut into the system clipboard
vim.cmd([[
noremap YY "+y<CR>
noremap XX "+x<CR>
]])

-- Clear matches with Ctrl+l
map('n', '<C-l>', ':noh<Cr>', opts)

-- Navigate buffers
map('n', '<S-l>', ':bnext<CR>', opts)
map('n', '<S-h>', ':bprevious<CR>', opts)

-- Telescope mappings
map('n', '<leader>ff', '<cmd>lua require(\'telescope.builtin\').find_files()<cr>', opts)
map('n', '<leader>of', '<cmd>lua require(\'telescope.builtin\').oldfiles()<cr>', opts)
map('n', '<leader>fs', '<cmd>lua require(\'telescope.builtin\').lsp_document_symbols()<cr>', opts)
map('n', '<leader>fg', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', opts)
map('n', '<leader>fb', '<cmd>lua require(\'telescope.builtin\').buffers()<cr>', opts)
map('n', '<leader>fh', '<cmd>lua require(\'telescope.builtin\').help_tags()<cr>', opts)
map('n', '<leader>cc', '<cmd>lua require(\'telescope.builtin\').search_history()<cr>', opts)
map('n', '<leader>cm', '<cmd>lua require(\'telescope.builtin\').git_commits()<cr>', opts)
map('n', '<leader>gt', '<cmd>lua require(\'telescope.builtin\').git_status()<cr>', opts)
map('n', '<leader>gb', '<cmd>lua require(\'telescope.builtin\').git_branch()<cr>', opts)

-- NvimTree
map('n', '<C-n>', '<cmd> NvimTreeToggle <cr>', opts)
map('n', '<leader>e', '<cmd> NvimTreeFocus <cr>', opts)

-- Barbar
map('n', '<leader>ba', '<cmd>BufferCloseAllButCurrent<cr>', opts)
map('n', '<leader>bc', '<cmd>BufferClose<cr>', opts)

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
  local lopts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], lopts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], lopts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], lopts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], lopts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], lopts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], lopts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
