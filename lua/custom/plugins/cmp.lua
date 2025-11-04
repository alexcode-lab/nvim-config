-- Autocompletion
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
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-omni',
    'saadparwaiz1/cmp_luasnip',
  },
  config = function()
    -- See `:help cmp`
    local cmp = require 'cmp'
    local ls = require 'luasnip'
    ls.config.setup {}

    vim.keymap.set({ 'i', 's' }, '<C-l>', function()
      ls.jump(1)
    end, { silent = true })
    vim.keymap.set({ 'i', 's' }, '<C-h>', function()
      ls.jump(-1)
    end, { silent = true })

    cmp.setup {
      snippet = {
        expand = function(args)
          ls.lsp_expand(args.body)
        end,
      },
      completion = {
        -- autocomplete = true,
        completeopt = 'menu,menuone,noinsert',
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
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'tags' },
        { name = 'omni', option = { disable_omnifuncs = { 'v:lua.vim.lsp.omnifunc' } } },
      },
    }
  end,
}
