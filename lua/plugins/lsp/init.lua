local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, bufopts)
  vim.keymap.set('n', '<leader>lf', vim.lsp.buf.formatting, bufopts)
  vim.keymap.set('v', '<leader>ls', '<Esc><cmd>lua vim.lsp.buf.range_formatting()<CR>', bufopts)
end

-- configuraciones
-- rust
lsp.rust_analyzer.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  -- Server-specific settings...
  settings = {
    ["rust-analyzer"] = {}
  }
}

-- Typescript
lsp.tsserver.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

-- Tailwind
lsp.tailwindcss.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

-- Lua
lsp.sumneko_lua.setup {
  on_attach = on_attach,
  flags = lsp_flags,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    }
  }
}

-- Json
lsp.jsonls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

-- bash
lsp.bashls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

-- yaml
lsp.yamlls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

-- yaml
lsp.yamlls.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

-- go
lsp.gopls.setup{
  on_attach = on_attach,
  flags = lsp_flags,
}

-- Python
lsp.pyright.setup{
  on_attach = on_attach,
  flags = lsp_flags,
}

-- docker
lsp.dockerls.setup{
  on_attach = on_attach,
  flags = lsp_flags,
}

-- sqls
lsp.sqls.setup{
  on_attach = on_attach,
  flags = lsp_flags,
}

-- php
lsp.phpactor.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

--[[ lsp.intelephense.setup { ]]
--[[   on_attach = on_attach, ]]
--[[   flags = lsp_flags, ]]
--[[ } ]]
