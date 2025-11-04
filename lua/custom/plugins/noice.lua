return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    presets = {
      lsp_doc_border = true,
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
