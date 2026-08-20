return {
  'folke/noice.nvim',
  opts = {
    lsp = {
      signature = {
        enabled = false, -- disable signature help popups
      },
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true,
      },
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
