return {
  'AndrewRadev/splitjoin.vim',
  event = 'VeryLazy',
  init = function()
    -- Set before plugin loads
    vim.g.splitjoin_join_mapping = ',j'
    vim.g.splitjoin_split_mapping = ',s'
  end,
}
