-- Copilot completion.
return {
  {
    'zbirenbaum/copilot.lua',
    event = 'InsertEnter',
    opts = {
      -- The panel is useless.
      panel = { enabled = false },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
          accept = '<C-l>',
          dismiss = '<C-k>',
          accept_word = false, -- disable default keymaps you don't use
          accept_line = false,
          next = '<M-n>',
          prev = '<M-p>',
        },
      },
      filetypes = {
        markdown = true,
        yaml = true,
      },
    },
  },
}
