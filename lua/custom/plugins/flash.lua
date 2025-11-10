return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  opts = {},
  keys = {
    {
      's',
      mode = { 'n', 'x', 'o' },
      function()
        require('flash').jump()
      end,
      desc = 'Flash',
    },
  },
  config = function()
    require('flash').setup {
      highlight = {
        backdrop = false, -- disable graying out everything except matches
      },
    }
  end,
}
