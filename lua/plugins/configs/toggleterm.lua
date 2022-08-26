local status_ok, toggleterm = pcall(require, "toggleterm")

if not status_ok then
  return
end

toggleterm.setup({
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "single",
    winblend = 3,
  },
  highlights = {
    FloatBorder = {
      guifg = "#282c34",
    },
  },
})

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end
