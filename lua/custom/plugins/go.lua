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

    -- Go keymaps
    vim.keymap.set('n', '<leader>gr', '<cmd>GoRun<CR>', { desc = '[G]o [R]un' })
    vim.keymap.set('n', '<leader>gb', '<cmd>GoBuild<CR>', { desc = '[G]o [B]build' })
    vim.keymap.set('n', '<leader>gt', '<cmd>GoTest<CR>', { desc = '[G]o [T]est' })
    vim.keymap.set('n', '<leader>gf', '<cmd>GoTestFunc<CR>', { desc = '[G]o Test [F]unc' })
    vim.keymap.set('n', '<leader>gc', '<cmd>GoCoverageToggle<CR>', { desc = '[G]o [C]overage' })
    vim.keymap.set('n', '<leader>gl', '<cmd>GoLint<CR>', { desc = '[G]o [L]int' })
    vim.keymap.set('n', '<leader>gv', '<cmd>GoVet<CR>', { desc = '[G]o [V]et' })
    vim.keymap.set('n', '<leader>gm', '<cmd>GoMetaLinter<CR>', { desc = '[G]o [M]eta Linter' })
    vim.keymap.set('n', '<leader>gn', '<cmd>GoRename<CR>', { desc = '[G]o Re[N]ame' })
    vim.keymap.set('n', '<leader>gi', '<cmd>GoImpl<CR>', { desc = '[G]o [I]mplement' })
  end,
  config = function() end,
}
