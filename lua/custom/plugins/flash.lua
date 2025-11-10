return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {},
  keys = {
    {
      'f',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump()
      end,
      desc = 'Flash',
    },
  },
  config = function()
    require('flash').setup {
      modes = {
        search = { enabled = false },
        char = { enabled = false },
        treesitter = { enabled = false },
      },
      highlight = {
        backdrop = false, -- disable graying out everything except matches
      },
    }
  end,
}
