-- Use ripgrep to search files

return {
  'folke/snacks.nvim',
  opts = {
    picker = {
      sources = {
        -- explorer = {},
      },
    },
  },
  config = function()
    Snacks = require 'snacks'
    Snacks.setup {
      picker = {
        sources = {
          explorer = {},
          files = {
            -- cmd = 'rg',
            -- args = { '--files', '--no-messages', '--color', 'never', '-g', '!.git' },
          },
        },
        win = {
          input = {
            keys = {
              ['<C-l>'] = { 'cancel', mode = { 'n', 'i' } },
            },
          },
        },
      },
    }
  end,
  keys = {
    {
      '<leader>e',
      function()
        Snacks.explorer {
          win = {
            list = {
              keys = {
                ['<C-o>'] = 'explorer_open', -- open with system application
                ['o'] = 'confirm',
              },
            },
          },
        }
      end,
      desc = 'File [E]xplorer',
    },
    {
      '<leader><leader>',
      function()
        Snacks.picker.buffers {
          current = false,
          win = {
            input = {
              keys = {
                ['<c-d>'] = { 'bufdelete', mode = { 'n', 'i' } },
                ['dd'] = { 'bufdelete', mode = { 'n' } },
              },
            },
          },
        }
      end,
      desc = 'Current Buffers',
    },
    {
      '<leader>ff',
      function()
        Snacks.picker.files {
          cmd = 'rg',
          args = { '--sortr', 'modified' },
        }
      end,
      desc = 'Find [F]iles',
    },
    {
      '<leader>fs',
      function()
        Snacks.picker.smart { cmd = 'rg' }
      end,
      desc = '[S]mart File find',
    },
    {
      '<leader>fg',
      function()
        Snacks.picker.git_files { cmd = 'rg' }
      end,
      desc = 'Find [G]it Files',
    },
    {
      '<leader>fp',
      function()
        Snacks.picker.projects()
      end,
      desc = 'Find [P]rojects',
    },
    {
      '<leader>fr',
      function()
        Snacks.picker.recent { cmd = 'rg' }
      end,
      desc = 'Find [R]ecent files',
    },
    {
      '<leader>fn',
      function()
        Snacks.picker.files { cmd = 'rg', cwd = vim.fn.stdpath 'config' }
      end,
      desc = 'Find [N]eovim File',
    },
    {
      '<leader>:',
      function()
        Snacks.picker.command_history()
      end,
      desc = 'Command History',
    },
    {
      '<leader>sN',
      function()
        Snacks.picker.notifications()
      end,
      desc = 'Notification History',
    },
    -- Grep
    {
      '<leader>sb',
      function()
        Snacks.picker.lines()
      end,
      desc = '[B]uffer fuzzy search',
    },
    {
      '<leader>/',
      function()
        Snacks.picker.grep_buffers()
      end,
      desc = 'Grep Open Buffers',
    },
    {
      '<leader>sg',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Grep',
    },
    {
      '<leader>sw',
      function()
        Snacks.picker.grep_word { finder = 'grep' }
      end,
      desc = 'Visual selection or word',
      mode = { 'n', 'x' },
    },
    -- search
    {
      '<leader>sr',
      function()
        Snacks.picker.registers()
      end,
      desc = 'Registers',
    },
    {
      '<leader>s/',
      function()
        Snacks.picker.search_history()
      end,
      desc = 'Search History',
    },
    {
      '<leader>sa',
      function()
        Snacks.picker.autocmds()
      end,
      desc = 'Autocmds',
    },
    {
      '<leader>sc',
      function()
        Snacks.picker.commands()
      end,
      desc = 'Commands',
    },
    {
      '<leader>sD',
      function()
        Snacks.picker.diagnostics()
      end,
      desc = 'Diagnostics',
    },
    {
      '<leader>sd',
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = 'Buffer Diagnostics',
    },
    {
      '<leader>sh',
      function()
        Snacks.picker.help()
      end,
      desc = 'Help Pages',
    },
    {
      '<leader>sH',
      function()
        Snacks.picker.highlights()
      end,
      desc = 'Highlights',
    },
    {
      '<leader>si',
      function()
        Snacks.picker.icons()
      end,
      desc = 'Icons',
    },
    {
      '<leader>sj',
      function()
        Snacks.picker.jumps()
      end,
      desc = 'Jumps',
    },
    {
      '<leader>sk',
      function()
        Snacks.picker.keymaps()
      end,
      desc = 'Keymaps',
    },
    {
      '<leader>sl',
      function()
        Snacks.picker.loclist()
      end,
      desc = 'Location List',
    },
    {
      '<leader>sm',
      function()
        Snacks.picker.marks()
      end,
      desc = 'Marks',
    },
    {
      '<leader>sM',
      function()
        Snacks.picker.man()
      end,
      desc = 'Man Pages',
    },
    {
      '<leader>sp',
      function()
        Snacks.picker.lazy()
      end,
      desc = 'Search for Plugin Spec',
    },
    {
      '<leader>sq',
      function()
        Snacks.picker.qflist()
      end,
      desc = 'Quickfix List',
    },
    {
      '<leader>u',
      function()
        Snacks.picker.undo()
      end,
      desc = 'Undo History',
    },
    {
      '<leader>sC',
      function()
        Snacks.picker.colorschemes()
      end,
      desc = 'Colorschemes',
    },
    -- LSP
    {
      'gd',
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = 'Goto Definition',
    },
    {
      'gD',
      function()
        Snacks.picker.lsp_declarations()
      end,
      desc = 'Goto Declaration',
    },
    {
      'gr',
      function()
        Snacks.picker.lsp_references()
      end,
      nowait = true,
      desc = 'References',
    },
    {
      'gI',
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = 'Goto Implementation',
    },
    {
      'gt',
      function()
        Snacks.picker.lsp_type_definitions()
      end,
      desc = 'Goto [T]ype Definition',
    },
    {
      'gci',
      function()
        Snacks.picker.lsp_incoming_calls()
      end,
      desc = '[C]alls Incoming',
    },
    {
      'gco',
      function()
        Snacks.picker.lsp_outgoing_calls()
      end,
      desc = '[C]alls Outgoing',
    },
    {
      '<leader>ss',
      function()
        Snacks.picker.lsp_symbols()
      end,
      desc = 'LSP Symbols',
    },
    {
      '<leader>sS',
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = 'LSP Workspace Symbols',
    },
    -- git
    {
      '<leader>gt',
      function()
        Snacks.picker.git_branches()
      end,
      desc = 'Git [t]ree Branches',
    },
    {
      '<leader>gl',
      function()
        Snacks.picker.git_log()
      end,
      desc = 'Git [l]og',
    },
    {
      '<leader>gL',
      function()
        Snacks.picker.git_log_line()
      end,
      desc = 'Git [L]og Line',
    },
    {
      '<leader>gs',
      function()
        Snacks.picker.git_status()
      end,
      desc = 'Git [s]tatus',
    },
    {
      '<leader>gS',
      function()
        Snacks.picker.git_stash()
      end,
      desc = 'Git [S]tash',
    },
    {
      '<leader>gd',
      function()
        Snacks.picker.git_diff()
      end,
      desc = 'Git [d]iff (Hunks)',
    },
    {
      '<leader>gf',
      function()
        Snacks.picker.git_log_file()
      end,
      desc = 'Git Log [f]ile',
    },
  },
}
