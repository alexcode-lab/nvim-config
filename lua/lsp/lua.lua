vim.lsp.config['lua_ls'] = {
  -- Filetypes to automatically attach to.
  filetypes = { 'lua' },
  --
  -- Command and arguments to start the server.
  -- cmd = { 'lua-language-server' },
  --
  -- Sets the "workspace" to the directory where any of these files is found.
  -- Files that share a root directory will reuse the LSP server connection.
  -- Nested lists indicate equal priority, see |vim.lsp.Config|.
  root_markers = { { '.luarc.json', '.luarc.jsonc' }, '.git' },
  -- Specific settings to send to the server. The schema is server-defined.
  -- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }, -- let the server know "vim" exists
      },
      runtime = {
        version = 'LuaJIT',
      },
    },
  },
}
vim.lsp.enable 'lua_ls'
