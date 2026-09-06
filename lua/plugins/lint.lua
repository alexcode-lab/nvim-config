return {

  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        markdown = { 'markdownlint' },
        go = { 'golangcilint' },
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
      local golangcilint = lint.linters.golangcilint
      golangcilint.append_fname = false
      golangcilint.ignore_exitcode = true
      golangcilint.args = {
        'run',
        '--output.json.path',
        'stdout',
        '--show-stats=false',
        './...',
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
