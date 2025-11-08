vim.opt.langmap =
  'ФИСВУАПРШОЛДЬТЩЗЙКІЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкіегмцчня;abcdefghijklmnopqrstuvwxyz'

vim.cmd [[
  autocmd BufRead,BufNewFile Makefile set filetype=make
  autocmd FileType make setlocal noexpandtab shiftwidth=4 softtabstop=0 
  autocmd FileType php setlocal autoindent shiftwidth=4 softtabstop=4
]]

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character

vim.o.autoindent = true
vim.o.smarttab = true
-- vim.o.fileformat = 'unix'
-- vim.o.textwidth = 120

vim.o.exrc = true
vim.o.secure = true
