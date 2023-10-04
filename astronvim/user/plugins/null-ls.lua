return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function(_, config)
    null_ls = require "null-ls"
    config.handlers = {
      golines = function()
        null_ls.register(null_ls.builtins.formatting.golines.with {
          args = { "-m", "120", "--no-reformat-tags", "--base-formatter", "gofumpt" },
        })
      end,
      goimports = function() end,
      goimports_reviser = function() null_ls.register(null_ls.builtins.formatting.goimports_reviser) end,
    }

    -- config variable is the default configuration table for the setup function call
    -- local null_ls = require "null-ls"

    -- Check supported formatters and linters
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Set a formatter
      null_ls.builtins.formatting.goimports_reviser,
      -- null_ls.builtins.formatting.stylua,
    }
    return config -- return final config table
  end,
}
