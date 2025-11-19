return { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    'mason-org/mason.nvim',
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- NOTE: Do I need this?
    -- 'j-hui/fidget.nvim',
    -- {
    --   'folke/lazydev.nvim',
    --   ft = 'lua', -- only load on lua files
    --   opts = {
    --     library = {
    --       -- See the configuration section for more details
    --       -- Load luvit types when the `vim.uv` word is found
    --       { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
    --     },
    --   },
    -- },
  },
  config = function()
    -- Brief aside: **What is LSP?**
    --
    -- LSP is an initialism you've probably heard, but might not understand what it is.
    --
    -- LSP stands for Language Server Protocol. It's a protocol that helps editors
    -- and language tooling communicate in a standardized fashion.
    --
    -- In general, you have a "server" which is some tool built to understand a particular
    -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
    -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
    -- processes that communicate with some "client" - in this case, Neovim!
    --
    -- LSP provides Neovim with features like:
    --  - Go to definition
    --  - Find references
    --  - Autocompletion
    --  - Symbol Search
    --  - and more!
    --
    -- Thus, Language Servers are external tools that must be installed separately from
    -- Neovim. This is where `mason` and related plugins come into play.
    --
    -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
    -- and elegantly composed help section, `:help lsp-vs-treesitter`

    --  This function gets run when an LSP attaches to a particular buffer.
    --    That is to say, every time a new file is opened that is associated with
    --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
    --    function will be executed to configure the current buffer
    vim.diagnostic.config {
      virtual_text = true,
      signs = true,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        border = 'rounded',
      },
    }
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        -- LSP keymaps
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = event.buf, desc = 'LSP:' .. '[R]e[n]ame' })
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = event.buf, desc = 'LSP:' .. '[C]ode [A]ction' })
        vim.keymap.set('n', '<leader>ls', vim.lsp.buf.document_symbol, { buffer = event.buf, desc = 'LSP:' .. '[L]ist document [s]ymbols' })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = event.buf, desc = 'LSP:' .. 'Hover Documentation' })

        vim.keymap.set('n', '<leader>th', function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, { desc = 'LSP:' .. '[T]oggle Inlay [H]ints' })

        -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to [I]mplementation' })
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Go to [R]eferences' })
        -- vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, { desc = 'Go to [D]definition' })
        -- vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, { desc = 'Go to Type [D]definition' })
        -- When you move your cursor, the highlights will be cleared (the second autocommand).
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
            end,
          })
        end
      end,
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Ensure the servers and tools above are installed
    --  To check the current status of installed tools and/or manually install
    --  other tools, you can run
    --    :Mason
    --
    --  You can press `g?` for help in this menu.
    require('mason').setup()

    -- You can add other tools here that you want Mason to install
    -- for you, so that they are available from within Neovim.
    local ensure_installed = {
      'lua_ls',
      'stylua',
      'superhtml',
      'intelephense',
      'laravel_ls',
      'fixjson',
      'gopls',
      'pyright',
      'cssls',
      -- 'rust_analyzer',
    }
    -- print(vim.inspect(ensure_installed))
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    ---@diagnostic disable-next-line: missing-fields
    require('mason-lspconfig').setup {
      ensure_installed = {},
    }
  end,
}
