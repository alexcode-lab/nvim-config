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
  config = function()
    -- Go keymaps
    vim.keymap.set('n', '<leader>ca', '<cmd>GoAlternate<CR>', { desc = 'Go to [A]lternate file' })
    vim.keymap.set('n', '<leader>cb', '<cmd>GoBuild<CR>', { desc = '[B]build' })
    vim.keymap.set('n', '<leader>ct', '<cmd>GoTest<CR>', { desc = '[T]est' })
    vim.keymap.set('n', '<leader>cf', '<cmd>GoTestFunc<CR>', { desc = 'Test [F]unc' })
    vim.keymap.set('n', '<leader>cc', '<cmd>GoCoverageToggle<CR>', { desc = 'Show [C]overage' })
    vim.keymap.set('n', '<leader>cl', '<cmd>GoLint<CR>', { desc = '[L]int' })
    vim.keymap.set('n', '<leader>cv', '<cmd>GoVet<CR>', { desc = '[V]et' })
    vim.keymap.set('n', '<leader>cm', '<cmd>GoMetaLinter<CR>', { desc = '[M]eta Linter' })
    vim.keymap.set('n', '<leader>cr', '<cmd>GoRename<CR>', { desc = '[R]ename' })
    vim.keymap.set('n', '<leader>ci', '<cmd>GoImpl<CR>', { desc = '[I]mplement interface' })
    vim.keymap.set('n', '<leader>ce', '<cmd>GoIfErr<CR>', { desc = 'Make If [E]rror block' })
  end,
}
