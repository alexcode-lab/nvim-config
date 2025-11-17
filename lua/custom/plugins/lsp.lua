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
        -- NOTE: Remember that Lua is a real programming language, and as such it is possible
        -- to define small helper and utility functions so you don't have to repeat yourself.
        --
        -- In this case, we create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local map = function(keys, func, desc)
          vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end

        -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to [I]mplementation' })
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Go to [R]eferences' })
        -- vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, { desc = 'Go to [D]definition' })
        -- vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, { desc = 'Go to Type [D]definition' })

        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-t>.
        -- map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

        -- Jump to the type of the word under your cursor.
        --  Useful when you're not sure what type a variable is and you want to see
        --  the definition of its *type*, not where it was *defined*.
        -- map('gD', require('telescope.builtin').lsp_type_definitions, '[G]oto Type [D]efinition')

        -- Find references for the word under your cursor.
        -- map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

        -- Jump to the implementation of the word under your cursor.
        --  Useful when your language has ways of declaring types without an actual implementation.
        -- map('gi', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

        -- NOTE: This is not Goto Definition, this is Goto Declaration.
        --  For example, in C this would take you to the header.
        -- map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        -- Fuzzy find all the symbols in your current document.
        --  Symbols are things like variables, functions, types, etc.
        -- map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

        -- Fuzzy find all the symbols in your current workspace.
        --  Similar to document symbols, except searches over your entire project.
        -- map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

        -- Rename the variable under your cursor.
        --  Most Language Servers support renaming across files, etc.
        map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

        -- Execute a cone action, usually your cursor needs to be on top of an error
        -- or a suggestion from your LSP for this to activate.
        map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

        map('<leader>ls', vim.lsp.buf.document_symbol, '[L]ist document [s]ymbols')

        -- Opens a popup that displays documentation about the word under your cursor
        --  See `:help K` for why this keymap.
        map('K', vim.lsp.buf.hover, 'Hover Documentation')

        -- The following two autocommands are used to highlight references of the
        -- word under your cursor when your cursor rests there for a little while.
        --    See `:help CursorHold` for information about when this is executed
        --
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

        -- The following autocommand is used to enable inlay hints in your
        -- code, if the language server you are using supports them
        --
        -- This may be unwanted, since they displace some of your code
        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }, -- let the server know "vim" exists
            },
          },
        },
      },
      pyright = {},
      intelephense = {
        files = {
          maxSize = 1000000,
        },
        -- Ensure stubs are enabled
        stubs = {
          'bcmath',
          'bz2',
          'calendar',
          'Core',
          'curl',
          'date',
          'dba',
          'dom',
          'enchant',
          'fileinfo',
          'filter',
          'ftp',
          'gd',
          'gettext',
          'hash',
          'iconv',
          'imap',
          'intl',
          'json',
          'ldap',
          'libxml',
          'mbstring',
          'mcrypt',
          'mysql',
          'mysqli',
          'password',
          'pcntl',
          'pcre',
          'PDO',
          'pdo_mysql',
          'Phar',
          'readline',
          'recode',
          'Reflection',
          'regex',
          'session',
          'SimpleXML',
          'soap',
          'sockets',
          'sodium',
          'SPL',
          'standard',
          'superglobals',
          'sysvsem',
          'sysvshm',
          'tokenizer',
          'xml',
          'xdebug',
          'xmlreader',
          'xmlwriter',
          'yaml',
          'zip',
          'zlib',
          'wordpress',
          'phpunit',
          'laravel',
        },
      },
      -- phpactor = {},
      gopls = {},
      -- rust_analyzer = {},
      -- solidity = {
      --   cmd = { 'nomicfoundation-solidity-language-server', '--stdio' },
      --   filetypes = { 'solidity' },
      --   root_dir = require('lspconfig.util').find_git_ancestor,
      --   single_file_support = true,
      -- },
    }

    -- Ensure the servers and tools above are installed
    --  To check the current status of installed tools and/or manually install
    --  other tools, you can run
    --    :Mason
    --
    --  You can press `g?` for help in this menu.
    require('mason').setup()

    -- You can add other tools here that you want Mason to install
    -- for you, so that they are available from within Neovim.
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua', -- Used to format Lua code
    })
    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    ---@diagnostic disable-next-line: missing-fields
    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for tsserver)
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          -- require('lspconfig')[server_name].setup(server)
          vim.lsp.config[server_name].setup(server)
        end,
      },
    }
  end,
}
