local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettier",
    extra_args = { "--print-with", "100", "--line-width", "120" },
    filetypes = { "typescript", "typescriptreact", "json", "css", "javascript" },
  },
})
