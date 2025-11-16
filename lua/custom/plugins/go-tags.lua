return {
  'mattn/vim-goaddtags',
  ft = { 'go' },
  config = function()
    -- Go keymaps
    vim.keymap.set('n', '<leader>tj', '<cmd>GoAddTags json<CR>', { desc = 'Add [J]son tags' })
    vim.keymap.set('n', '<leader>td', '<cmd>GoAddTags db<CR>', { desc = 'Add [D]b tags' })
    vim.keymap.set('n', '<leader>tr', '<cmd>GoRemoveTags<CR>', { desc = '[R]emove tags' })
  end,
}
