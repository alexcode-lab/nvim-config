return {
  'fatih/vim-go',
  ft = { 'go' },
  init = function()
    -- Set before plugin loads
    vim.g.go_list_type = 'quickfix'
    vim.g.go_highlight_types = 1
    vim.g.go_highlight_fields = 1
    vim.g.go_highlight_functions = 1
    vim.g.go_highlight_function_calls = 1
  end,
}
