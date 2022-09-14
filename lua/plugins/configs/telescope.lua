local status_ok, telescope = pcall(require, "telescope")

if not status_ok then
  return
end

telescope.setup {
  extensions = {
    file_browser = {
      hijack_netrw = true,
    },
    project = {
      hidden_files = false, -- default: false
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
