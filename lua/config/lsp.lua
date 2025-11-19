-- Setting up LSP
-- Inline LSP diagnosic messages
vim.diagnostic.config {
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    border = 'rounded',
  },
}
-- On attach/detach buffers
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    -- LSP keymaps
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = event.buf, desc = 'LSP:' .. '[R]e[n]ame' })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = event.buf, desc = 'LSP:' .. '[C]ode [A]ction' })
    -- vim.keymap.set('n', '<leader>ls', vim.lsp.buf.document_symbol, { buffer = event.buf, desc = 'LSP:' .. '[L]ist document [s]ymbols' })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = event.buf, desc = 'LSP:' .. 'Hover Documentation' })

    vim.keymap.set('n', '<leader>th', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, { desc = 'LSP:' .. '[T]oggle Inlay [H]ints' })

    -- vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, { desc = 'Go to [I]mplementation' })
    -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Go to [R]eferences' })
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, { desc = 'Go to [D]definition' })
    -- vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, { desc = 'Go to Type [D]definition' })

    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
        end,
      })
    end
  end,
})
