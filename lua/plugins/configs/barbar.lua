local status_ok, barbar = pcall(require, "bufferline")

if not status_ok then
  return
end

barbar.setup {
  auto_hide = true,
  closable = false,
  clickable = false,
  animation = false,
}
