return {
  'johmsalas/text-case.nvim',
  config = function()
    vim.keymap.set({ 'n', 'v' }, ',ts', ":lua require('textcase').current_word('to_snake_case')<CR>", { desc = 'Convert to [S]nake case' })
    vim.keymap.set({ 'n', 'v' }, ',tc', ":lua require('textcase').current_word('to_camel_case')<CR>", { desc = 'Convert to [C]amel case' })
    vim.keymap.set({ 'n', 'v' }, ',td', ":lua require('textcase').current_word('to_dot_case')<CR>", { desc = 'Convert to [D]ot case' })
    vim.keymap.set({ 'n', 'v' }, ',tp', ":lua require('textcase').current_word('to_pascal_case')<CR>", { desc = 'Convert to [P]ascal case' })
    vim.keymap.set({ 'n', 'v' }, ',tt', ":lua require('textcase').current_word('to_title_case')<CR>", { desc = 'Convert to [T]title case' })
    vim.keymap.set({ 'n', 'v' }, ',tu', ":lua require('textcase').current_word('to_constant_case')<CR>", { desc = 'Convert to [U]pper case' })
  end,
  keys = {
    ',t', -- Default invocation prefix
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
