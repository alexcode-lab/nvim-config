return {
  'johmsalas/text-case.nvim',
  config = function()
    vim.keymap.set({ 'n', 'v' }, 'gas', ":lua require('textcase').current_word('to_snake_case')<CR>", { desc = 'Convert to [S]nake case' })
    vim.keymap.set({ 'n', 'v' }, 'gac', ":lua require('textcase').current_word('to_camel_case')<CR>", { desc = 'Convert to [C]amel case' })
    vim.keymap.set({ 'n', 'v' }, 'gap', ":lua require('textcase').current_word('to_pascal_case')<CR>", { desc = 'Convert to [P]ascal case' })
    vim.keymap.set({ 'n', 'v' }, 'gat', ":lua require('textcase').current_word('to_title_case')<CR>", { desc = 'Convert to [T]title case' })
  end,
  keys = {
    'ga', -- Default invocation prefix
  },
  cmd = {
    -- NOTE: The Subs command name can be customized via the option "substitude_command_name"
    'Subs',
    'TextCaseStartReplacingCommand',
  },
  -- If you want to use the interactive feature of the `Subs` command right away, text-case.nvim
  -- has to be loaded on startup. Otherwise, the interactive feature of the `Subs` will only be
  -- available after the first executing of it or after a keymap of text-case.nvim has been used.
  lazy = false,
}
