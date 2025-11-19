vim.o.langmap =
  'ФИСВУАПРШОЛДЬТЩЗЙКІЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкіегмцчня;abcdefghijklmnopqrstuvwxyz'

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character

vim.o.autoindent = true
vim.o.smarttab = true
vim.o.fileformat = 'unix'
vim.o.textwidth = 120

vim.o.exrc = true
vim.o.secure = true

vim.opt.foldenable = false
vim.opt.foldlevel = 20

-- change blade templates type to html for using superhtml lsp
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.blade.php',
  command = 'set filetype=html',
})

vim.api.nvim_create_autocmd({ 'FileType' }, {
  callback = function()
    -- check if treesitter has parser
    if require('nvim-treesitter.parsers').has_parser() then
      -- use treesitter folding
      vim.opt.foldmethod = 'expr'
      vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
    else
      -- use alternative foldmethod
      vim.opt.foldmethod = 'syntax'
    end
  end,
})

-- vim.cmd [[
--   autocmd BufRead,BufNewFile Makefile set filetype=make
--   autocmd FileType make setlocal noexpandtab shiftwidth=4 softtabstop=0
--   autocmd FileType php setlocal autoindent shiftwidth=4 softtabstop=4 tabstop=4 expandtab autoindent smarttab
-- ]]
