return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    -- Snippet Engine & its associated nvim-cmp source
    {
      'L3MON4D3/LuaSnip',
      build = (function()
        return 'make install_jsregexp'
      end)(),
      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
            require('luasnip.loaders.from_vscode').lazy_load { paths = { './snippets/' } }
          end,
        },
      },
    },
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-buffer',
    'saadparwaiz1/cmp_luasnip',
    -- 'hrsh7th/cmp-omni',
  },
  config = function()
    -- See `:help cmp`
    local cmp = require 'cmp'
    local ls = require 'luasnip'
    unpack = unpack or table.unpack

    ls.config.setup {}

    vim.keymap.set({ 'i', 's' }, '<C-l>', function()
      ls.jump(1)
    end, { silent = true })
    vim.keymap.set({ 'i', 's' }, '<C-h>', function()
      ls.jump(-1)
    end, { silent = true })

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
    end

    local entry_filter = function(_, ctx)
      -- Get the text before cursor
      local cursor_before_line = ctx.cursor_before_line
      -- Disable buffer completions after common trigger characters
      return not vim.regex([[\k\+\.\|:\|->]]):match_str(cursor_before_line)
    end

    cmp.setup {
      snippet = {
        expand = function(args)
          ls.lsp_expand(args.body)
        end,
      },
      completion = {
        -- autocomplete = false,
        completeopt = 'menu,menuone,noinsert',
      },
      matching = {
        disallow_fuzzy_matching = true,
        disallow_partial_matching = false,
        disallow_prefix_unmatching = false,
      },
      window = {
        -- completion = cmp.config.window.bordered {
        --   border = 'rounded',
        --   winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder',
        -- },
        documentation = cmp.config.window.bordered {
          border = 'rounded',
          winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder',
        },
      },
      -- For an understanding of why these mappings were
      -- chosen, you will need to read `:help ins-completion`
      --
      -- No, but seriously. Please read `:help ins-completion`, it is really good!
      mapping = {
        -- Select the [n]ext item
        ['<C-n>'] = cmp.mapping.select_next_item(),
        -- Select the [p]revious item
        ['<C-p>'] = cmp.mapping.select_prev_item(),

        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-e>'] = cmp.mapping {
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        },

        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif ls.expand_or_jumpable() then
            ls.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif ls.jumpable(-1) then
            ls.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = {
        {
          name = 'luasnip',
          priority = 1000,
          entry_filter = entry_filter,
        },
        { name = 'nvim_lsp', priority = 750 },
        {
          name = 'buffer',
          priority = 500,
          keyword_length = 2,
          max_item_count = 7,
          entry_filter = entry_filter,
          option = {
            get_bufnrs = function()
              -- Use all listed buffers
              return vim.api.nvim_list_bufs()
            end,
          },
        },
        { name = 'path', priority = 250 }, -- autocomplete path
        -- {
        --   name = 'omni',
        --   priority = 100,
        --   option = { disable_omnifuncs = { 'v:lua.vim.lsp.omnifunc' } },
        -- },
      },
    }
  end,
}
