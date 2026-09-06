-- Keymaps for vim-go plugin
vim.keymap.set('n', '<leader>cga', '<cmd>GoAlternate<CR>', { desc = '[G]o to [A]lternate file' })
vim.keymap.set('n', '<leader>cb', '<cmd>GoBuild<CR>', { desc = '[B]build' })
vim.keymap.set('n', '<leader>cta', '<cmd>GoTest<CR>', { desc = '[T]est' })
vim.keymap.set('n', '<leader>ctf', '<cmd>GoTestFunc<CR>', { desc = 'Test [F]unc' })
vim.keymap.set('n', '<leader>cc', '<cmd>GoCoverageToggle<CR>', { desc = 'Toggle [C]overage' })
vim.keymap.set('n', '<leader>cv', '<cmd>GoVet<CR>', { desc = '[V]et' })
vim.keymap.set('n', '<leader>cm', '<cmd>GoMetaLinter<CR>', { desc = '[M]eta Linter' })
vim.keymap.set('n', '<leader>cd', '<cmd>GoDiagnostics<CR>', { desc = '[D]iagnositcs' })
vim.keymap.set('n', '<leader>cr', '<cmd>GoRename<CR>', { desc = '[R]ename' })
vim.keymap.set('n', '<leader>ci', '<cmd>GoImpl<CR>', { desc = 'Implement [I]nterface' })
vim.keymap.set('n', '<leader>ce', '<cmd>GoErrCheck<CR>', { desc = '[E]rror Check' })

-- Keymaps for go-tags plugin
vim.keymap.set('n', '<leader>ctj', '<cmd>GoAddTags json<CR>', { desc = 'Add [J]son tags' })
vim.keymap.set('n', '<leader>ctd', '<cmd>GoAddTags db<CR>', { desc = 'Add [D]b tags' })
vim.keymap.set('n', '<leader>ctr', '<cmd>GoRemoveTags<CR>', { desc = '[R]emove tags' })

local function golangci_lint_project()
  local root = vim.fs.root(0, 'go.mod') or vim.fn.getcwd()

  vim.system({
    'golangci-lint',
    'run',
    '--output.json.path=stdout',
    '--output.text.path=', -- disable text output (same fix as before — avoids the pipe deadlock)
    '--path-mode=abs',
    '--show-stats=false',
    './...',
  }, { text = true, cwd = root }, function(obj)
    vim.schedule(function()
      if not obj.stdout or obj.stdout == '' then
        vim.notify('golangci-lint: no output', vim.log.levels.WARN)
        return
      end

      local ok, decoded = pcall(vim.json.decode, obj.stdout)
      if not ok then
        vim.notify('golangci-lint: failed to parse JSON output', vim.log.levels.ERROR)
        return
      end

      if decoded.Issues == vim.NIL or decoded.Issues == nil or #decoded.Issues == 0 then
        vim.notify('golangci-lint: SUCCESS! No issues found.', vim.log.levels.INFO)
        vim.fn.setqflist({}, ' ', { title = 'golangci-lint', items = {} })
        return
      end

      local severity_map = { error = 'E', warning = 'W' }
      local items = {}
      for _, issue in ipairs(decoded.Issues) do
        table.insert(items, {
          filename = issue.Pos.Filename,
          lnum = issue.Pos.Line,
          col = issue.Pos.Column,
          text = string.format('[%s] %s', issue.FromLinter, issue.Text),
          type = severity_map[issue.Severity] or 'W',
        })
      end

      vim.fn.setqflist({}, ' ', { title = 'golangci-lint', items = items })
      vim.cmd 'copen'
    end)
  end)
end

vim.keymap.set('n', '<leader>cl', golangci_lint_project, { desc = '[L]int' })
