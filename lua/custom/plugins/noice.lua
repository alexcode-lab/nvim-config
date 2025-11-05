return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    lsp = {
      signature = { enabled = true }, -- disable signature help popups
    },
    presets = {
      lsp_doc_border = true,
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
    },
    cmdline = {
      format = {
        search_down = { kind = 'search', pattern = '^/', icon = '  ', lang = 'regex' },
        search_up = { kind = 'search', pattern = '^%?', icon = '  ', lang = 'regex' },
      },
    },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
}
