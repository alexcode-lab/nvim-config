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
