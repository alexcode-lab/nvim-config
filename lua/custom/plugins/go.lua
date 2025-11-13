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
    vim.keymap.set('n', '<leader>ca', '<cmd>GoAlternate<CR>', { desc = '[C]ode go to [A]lternate file' })
    vim.keymap.set('n', '<leader>cb', '<cmd>GoBuild<CR>', { desc = '[C]ode [B]build' })
    vim.keymap.set('n', '<leader>ct', '<cmd>GoTest<CR>', { desc = '[C]ode [T]est' })
    vim.keymap.set('n', '<leader>cf', '<cmd>GoTestFunc<CR>', { desc = '[C]ode Test [F]unc' })
    vim.keymap.set('n', '<leader>cc', '<cmd>GoCoverageToggle<CR>', { desc = '[C]ode Show [C]overage' })
    vim.keymap.set('n', '<leader>cl', '<cmd>GoLint<CR>', { desc = '[C]ode [L]int' })
    vim.keymap.set('n', '<leader>cv', '<cmd>GoVet<CR>', { desc = '[C]ode [V]et' })
    vim.keymap.set('n', '<leader>cm', '<cmd>GoMetaLinter<CR>', { desc = '[C]ode [M]eta Linter' })
    vim.keymap.set('n', '<leader>cr', '<cmd>GoRename<CR>', { desc = '[C]ode [R]ename' })
    vim.keymap.set('n', '<leader>ci', '<cmd>GoImpl<CR>', { desc = '[C]ode [I]mplement' })
    vim.keymap.set('n', '<leader>ce', '<cmd>GoIfErr<CR>', { desc = '[C]ode Make If [E]rror block' })
  end,
}
