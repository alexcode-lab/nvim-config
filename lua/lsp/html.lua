vim.lsp.config['superhtml'] = {
  name = 'superhtml',
  cmd = { 'superhtml', 'lsp' },
  filetypes = { 'html', 'shtml', 'htm', 'blade' },
}
vim.lsp.enable 'superhtml'
