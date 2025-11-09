return {
  'mattn/vim-goaddtags',
  event = 'VeryLazy',
  ft = { 'go' },
  config = function()
    -- Go keymaps
    vim.keymap.set('n', '<leader>gj', '<cmd>GoAddTags json<CR>', { desc = '[G]o Add [J]son tags' })
    vim.keymap.set('n', '<leader>gd', '<cmd>GoAddTags db<CR>', { desc = '[G]o Add [D]b tags' })
  end,
}
