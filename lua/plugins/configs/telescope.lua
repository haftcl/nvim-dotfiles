local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
  return
end

local work_dir = os.getenv('JOB_WORK_DIR')
local personal_work_dir = os.getenv('PERSONAL_WORK_DIR')

telescope.setup {
  extensions = {
    file_browser = {
      hijack_netrw = true,
    },
    project = {
      base_dirs = {
        work_dir .. '/10/ds10',
        personal_work_dir .. '/AgendaMe',
      },
      hidden_files = true, -- default: false
      theme = "dropdown"
    },
    ["ui-select"] = {
      theme = "dropdown"
    },
  }
}

telescope.load_extension "file_browser"
telescope.load_extension "fzf"
telescope.load_extension "project"
telescope.load_extension "ui-select"
