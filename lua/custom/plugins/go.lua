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
    vim.keymap.set('n', '<leader>cga', '<cmd>GoAlternate<CR>', { desc = '[G]o to [A]lternate file' })
    vim.keymap.set('n', '<leader>cB', '<cmd>GoBuild<CR>', { desc = '[B]build' })
    vim.keymap.set('n', '<leader>cT', '<cmd>GoTest<CR>', { desc = '[T]est' })
    vim.keymap.set('n', '<leader>cF', '<cmd>GoTestFunc<CR>', { desc = 'Test [F]unc' })
    vim.keymap.set('n', '<leader>cc', '<cmd>GoCoverageToggle<CR>', { desc = 'Toggle [C]overage' })
    vim.keymap.set('n', '<leader>cl', '<cmd>GoLint<CR>', { desc = '[L]int' })
    vim.keymap.set('n', '<leader>cv', '<cmd>GoVet<CR>', { desc = '[V]et' })
    vim.keymap.set('n', '<leader>cm', '<cmd>GoMetaLinter<CR>', { desc = '[M]eta Linter' })
    vim.keymap.set('n', '<leader>cd', '<cmd>GoDiagnostics<CR>', { desc = '[D]iagnositcs' })
    vim.keymap.set('n', '<leader>cr', '<cmd>GoRename<CR>', { desc = '[R]ename' })
    vim.keymap.set('n', '<leader>ci', '<cmd>GoImpl<CR>', { desc = 'Implement [I]nterface' })
    vim.keymap.set('n', '<leader>ce', '<cmd>GoErrCheck<CR>', { desc = '[E]rror Check' })
  end,
}
