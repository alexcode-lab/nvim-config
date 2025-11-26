local map = vim.keymap.set

map('n', '<leader>cm', '<cmd>PhpTools Method<cr>', { desc = 'Create missing method' })
map('n', '<leader>cc', '<cmd>PhpTools Class<cr>', { desc = 'Create missing class' })
map('n', '<leader>cs', '<cmd>PhpTools Scripts<cr>', { desc = 'Run composer script' })
map('n', '<leader>cg', '<cmd>PhpTools GetSet<cr>', { desc = 'Add Get/Set methods' })
map('n', '<leader>cf', '<cmd>PhpTools Create<cr>', { desc = 'Create new' })
map('v', '<leader>cr', '<cmd>PhpTools Refactor<cr>', { desc = 'Refactor' })
