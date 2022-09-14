local status_ok, _ = pcall(require, "dashboard")

if not status_ok then
  return
end

local db = require('dashboard')

db.custom_center = {
  {
    icon = '  ',
    desc = 'Find  File                              ',
    action = 'Telescope find_files find_command=rg,--hidden,--files',
    shortcut = 'SPC f f'
  },
  {
    icon = '  ',
    desc = 'Find Projects                           ',
    shortcut = 'SPC f p',
    action = 'Telescope projects'
  },
  {
    icon = '  ',
    desc = 'File Browser                            ',
    action = 'Telescope file_browser',
    shortcut = 'SPC f o'
  },
  {
    icon = '  ',
    desc = 'Find  word                              ',
    action = 'Telescope live_grep',
    shortcut = 'SPC f g'
  },
}
