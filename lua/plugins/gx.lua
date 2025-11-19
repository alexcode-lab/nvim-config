return {
  --[[ 'chrishrb/gx.nvim',
  keys = { { 'gx', '<cmd>Browse<cr>', mode = { 'n', 'x' } } },
  cmd = { 'Browse' },
  init = function()
    vim.g.netrw_nogx = 1 -- disable netrw gx
  end,
  dependencies = { 'nvim-lua/plenary.nvim' }, -- Required for Neovim < 0.10.0
  submodules = false, -- not needed, submodules are required only for tests

  -- you can specify also another config if you want
  config = function()
    require('gx').setup {
      open_browser_app = 'xdg-open', -- specify your browser app; default for macOS is "open", Linux "xdg-open" and Windows "powershell.exe"
      -- open_browser_args = { '--background' }, -- specify any arguments, such as --background for macOS' "open".

      -- open_callback = function(url)
      -- vim.fn.setreg('+', url) -- for example, you can set the url to clipboard here
      -- end,

      select_prompt = false, -- shows a prompt when multiple handlers match; disable to auto-select the top one

      handlers = {
        plugin = true, -- open plugin links in lua (e.g. packer, lazy, ..)
        github = true, -- open github issues
        brewfile = true, -- open Homebrew formulaes and casks
        package_json = true, -- open dependencies from package.json
        go = true, -- open pkg.go.dev from an import statement (uses treesitter)
        search = true, -- search the web/selection on the web if nothing else is found
        rust = { -- custom handler to open rust's cargo packages
          name = 'rust', -- set name of handler
          filetype = { 'toml' }, -- you can also set the required filetype for this handler
          filename = 'Cargo.toml', -- or the necessary filename
          handle = function(mode, line, _)
            local crate = require('gx.helper').find(line, mode, '(%w+)%s-=%s')

            if crate then
              return 'https://crates.io/crates/' .. crate
            end
          end,
        },
        php = {
          name = 'php', -- set name of handler
          filetype = { 'json' }, -- you can also set the required filetype for this handler
          filename = 'composer.json', -- or the necessary filename
          handle = function(mode, line, _)
            local package = require('gx.helper').find(line, mode, '"([%w-_]+/[.%w-_]+)"%s*:')
            if package then
              return 'https://packagist.org/packages/' .. package
            end
          end,
        },
      },
      handler_options = {
        search_engine = 'google', -- you can select between google, bing, duckduckgo, ecosia and yandex
        -- search_engine = 'https://google.com/search?q=', -- or you can pass in a custom search engine
      },
    }
  end, ]]
}
