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
              gui = 'bold',
            },
          },
        },
        lualine_b = {
          {
            'filename',
            path = 1,
            color = {
              fg = colors.fg,
              -- gui = 'bold',
            },
            file_status = true,
            newfile_status = true,
            shorting_target = 40,
          },
        },
        lualine_c = {
          'searchcount',
          'selectioncount',
          {
            'diagnostics',
            sources = { 'nvim_diagnostic', 'coc' },
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
              gui = 'bold',
            },
          },
          {
            'fileformat',
            fmt = string.upper,
            icons_enabled = false,
            color = { fg = colors.fg, gui = 'bold' },
          },
          'filetype',
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
