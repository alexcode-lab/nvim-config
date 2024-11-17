vim.opt.langmap =
  'ФИСВУАПРШОЛДЬТЩЗЙКІЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкіегмцчня;abcdefghijklmnopqrstuvwxyz'

vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local row, col = unpack(vim.api.nvim_buf_get_mark(0, '"'))
    if row > 1 and row <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, { row, col })
    end
  end,
})

vim.cmd [[
  autocmd BufRead,BufNewFile *.blade.php set filetype=html
  autocmd FileType python set dictionary=$HOME/.config/nvim/dict/python
  autocmd FileType php set dictionary=$HOME/.config/nvim/dict/php
  autocmd FileType make setlocal noexpandtab shiftwidth=4 softtabstop=0 expandtab=false
]]

-- Set the number of spaces that a <Tab> character occupies
vim.opt.tabstop = 4

-- Set the number of spaces to use for each step of (auto)indent
vim.opt.shiftwidth = 4
