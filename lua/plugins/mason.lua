return { -- LSP Configuration & Plugins
  'mason-org/mason.nvim',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'neovim/nvim-lspconfig',
  },
  opts = {},
  config = function()
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
