return {
  'mattn/vim-goaddtags',
  ft = { 'go' },
  config = function()
    -- Go keymaps
    vim.keymap.set('n', '<leader>ctj', '<cmd>GoAddTags json<CR>', { desc = 'Add [T]ags [J]son' })
    vim.keymap.set('n', '<leader>ctd', '<cmd>GoAddTags db<CR>', { desc = 'Add [T]ags [D]b' })
    vim.keymap.set('n', '<leader>ctr', '<cmd>GoRemoveTags<CR>', { desc = '[T]ags R[E]move' })
  end,
}
