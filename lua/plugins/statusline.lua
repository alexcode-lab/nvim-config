return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local colors = {
      bg = '#202328',
      bgDarker = '#24272e',
      fg = '#bbc2cf',
      yellow = '#ECBE7B',
      cyan = '#008080',
      green = '#98be65',
      orange = '#FF8800',
      violet = '#a9a1e1',
      red = '#ec5f67',
    }
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'nightfly',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = {
          'mode',
          {
            'branch',
            icon = ' ',
            color = {
              fg = colors.violet,
              bg = colors.bgDarker,
            },
          },
        },
        lualine_b = {
          {
            'filename',
            path = 1,
            color = {
              fg = colors.fg,
            },
            file_status = true,
            newfile_status = true,
            shorting_target = 40,
            symbols = {
              modified = '[+]', -- Text to show when the file is modified.
              readonly = '[-]', -- Text to show when the file is non-modifiable or readonly.
              unnamed = '[No Name]', -- Text to show for unnamed buffers.
              newfile = '[New]', -- Text to show for newly created file before first write
            },
          },
        },
        lualine_c = {
          'searchcount',
          'selectioncount',
          {
            'diagnostics',
            sources = { 'nvim_diagnostic' },
            diagnostics_color = {
              error = { fg = colors.red },
              warn = { fg = colors.yellow },
              info = { fg = colors.cyan },
            },
          },
        },
        lualine_x = {
          {
            'diff',
            symbols = { added = '+', modified = '~', removed = '-' },
            diff_color = {
              added = { fg = colors.green },
              modified = { fg = colors.orange },
              removed = { fg = colors.red },
            },
          },
          'progress',
          'location',
          'filesize',
          {
            'encoding',
            color = {
              fg = colors.green,
            },
            show_bomb = true,
          },
          {
            'fileformat',
            fmt = string.upper,
            icons_enabled = false,
            color = { fg = colors.fg },
          },
          {
            'filetype',
          },
        },
        lualine_y = {},
        lualine_z = {
          -- {
          --   'datetime',
          --   style = '%H:%M',
          -- },
        },
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }
  end,
}
