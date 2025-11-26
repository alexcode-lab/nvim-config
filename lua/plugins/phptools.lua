return {
  'ccaglak/phptools.nvim',
  ft = { 'php' },
  keys = {
    { '<leader>cm', '<cmd>PhpTools Method<cr>' },
    { '<leader>cc', '<cmd>PhpTools Class<cr>' },
    { '<leader>cs', '<cmd>PhpTools Scripts<cr>' },
    { '<leader>cn', '<cmd>PhpTools Namespace<cr>' },
    { '<leader>cg', '<cmd>PhpTools GetSet<cr>' },
    { '<leader>cf', '<cmd>PhpTools Create<cr>' },
    { mode = 'v', '<leader>cr', '<cmd>PhpTools Refactor<cr>' },
  },
  dependencies = {
    -- "ccaglak/namespace.nvim", -- optional - php namespace resolver
    -- "ccaglak/larago.nvim", -- optional -- laravel goto blade/components
    -- "ccaglak/snippets.nvim", -- optional -- native snippet expander
  },
  config = function()
    require('phptools').setup {
      ui = {
        enable = true, -- default:true; false only if you have a UI enhancement plugin
        fzf = false, -- default:false; tests requires fzf used only in tests module otherwise there might long list  of tests
      },
      drupal_autoloader = { -- delete if you dont use it
        enable = false, -- default:false
      },
      custom_toggles = { -- delete if you dont use it
        enable = false, -- default:false
        -- { "foo", "bar", "baz" }, -- Add more custom toggle groups here
      },
    }

    local map = vim.keymap.set

    local tests = require 'phptools.tests' -- delete if you have a test plugin
    map('n', '<Leader>cta', tests.test.all, { desc = 'Run all tests' })
    map('n', '<Leader>ctf', tests.test.file, { desc = 'Run current file tests' })
    map('n', '<Leader>ctl', tests.test.line, { desc = 'Run test at cursor' })
    map('n', '<Leader>cts', tests.test.filter, { desc = 'Search and run test' })
    map('n', '<Leader>ctp', tests.test.parallel, { desc = 'Run tests in parallel' })
    map('n', '<Leader>ctr', tests.test.rerun, { desc = 'Rerun last test' })
    map('n', '<Leader>cti', tests.test.selected, { desc = 'Run selected test file' })
  end,
}
