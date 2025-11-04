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
  autocmd BufRead,BufNewFile Makefile set filetype=make
  autocmd BufRead,BufNewFile *.blade.php set filetype=html
  autocmd FileType make setlocal noexpandtab shiftwidth=4 softtabstop=0 
  autocmd FileType nim setlocal noexpandtab shiftwidth=4 softtabstop=0
  autocmd FileType php setlocal noexpandtab shiftwidth=4 softtabstop=0
]]

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

vim.o.autoindent = true
vim.o.smarttab = true
vim.o.fileformat = 'unix'
vim.o.textwidth = 120

vim.o.exrc = true
vim.o.secure = true
