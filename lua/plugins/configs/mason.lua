local status_ok, mason = pcall(require, "mason")

if not status_ok then
  return
end

local mlstatus_ok, masonlsp = pcall(require, "mason-lspconfig")

if not mlstatus_ok then
  return
end

mason.setup()
masonlsp.setup()
