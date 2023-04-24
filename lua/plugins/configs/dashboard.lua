local status_ok, _ = pcall(require, "dashboard")

if not status_ok then
  return
end

local db = require('dashboard')

db.setup {
  theme = 'hyper',
  hide = {
    statusline = true,
  },
}
