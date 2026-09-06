return {

  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        markdown = { 'markdownlint' },
        go = { 'golangcilint', 'revive' },
        rust = { 'cargo' },
      }
      lint.linters.cargo = {
        cmd = 'cargo check',
        stdin = true,
        args = {},
        stream = 'both',
        ignore_exitcode = false,
        env = nil,
      }
      local golangcilint = require 'lint.linters.golangcilint'
      golangcilint.append_fname = true
      golangcilint.args = {
        'run',
        '--out-format',
        'json',
      }
      --[[ local phpcs = lint.linters.phpcs
      phpcs.args = {
        '-q',
        '--report=json',
        '-',
      } ]]

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          require('lint').try_lint()
        end,
      })
    end,
  },
}
