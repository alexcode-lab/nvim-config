-- Keymaps for vim-go plugin
vim.keymap.set('n', '<leader>cga', '<cmd>GoAlternate<CR>', { desc = '[G]o to [A]lternate file' })
vim.keymap.set('n', '<leader>cb', '<cmd>GoBuild<CR>', { desc = '[B]build' })
vim.keymap.set('n', '<leader>cta', '<cmd>GoTest<CR>', { desc = '[T]est' })
vim.keymap.set('n', '<leader>ctf', '<cmd>GoTestFunc<CR>', { desc = 'Test [F]unc' })
vim.keymap.set('n', '<leader>cc', '<cmd>GoCoverageToggle<CR>', { desc = 'Toggle [C]overage' })
vim.keymap.set('n', '<leader>cl', '<cmd>GoLint<CR>', { desc = '[L]int' })
vim.keymap.set('n', '<leader>cv', '<cmd>GoVet<CR>', { desc = '[V]et' })
vim.keymap.set('n', '<leader>cm', '<cmd>GoMetaLinter<CR>', { desc = '[M]eta Linter' })
vim.keymap.set('n', '<leader>cd', '<cmd>GoDiagnostics<CR>', { desc = '[D]iagnositcs' })
vim.keymap.set('n', '<leader>cr', '<cmd>GoRename<CR>', { desc = '[R]ename' })
vim.keymap.set('n', '<leader>ci', '<cmd>GoImpl<CR>', { desc = 'Implement [I]nterface' })
vim.keymap.set('n', '<leader>ce', '<cmd>GoErrCheck<CR>', { desc = '[E]rror Check' })

-- Keymaps for go-tags plugin
vim.keymap.set('n', '<leader>ctj', '<cmd>GoAddTags json<CR>', { desc = 'Add [J]son tags' })
vim.keymap.set('n', '<leader>ctd', '<cmd>GoAddTags db<CR>', { desc = 'Add [D]b tags' })
vim.keymap.set('n', '<leader>ctr', '<cmd>GoRemoveTags<CR>', { desc = '[R]emove tags' })
