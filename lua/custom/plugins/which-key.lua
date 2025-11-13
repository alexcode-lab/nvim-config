return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').add {
      { '<leader>f', group = '[F]ind file' },
      { '<leader>s', group = '[S]earch in files' },
      { '<leader>r', group = '[R]ename' },
      { '<leader>g', group = '[G]it' },
      { '<leader>c', group = '[C]ode Actions' },
      { '<leader>h', group = 'Toggle [H]arpoon' },
      -- { '<leader>n', group = '[N]oice' },

      { ',j', group = 'Join object' },
      { ',s', group = 'Split object' },
    }
  end,
}
