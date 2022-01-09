local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "stylua", filetypes = { "lua" }, args = { "--indent-width", "2", "--indent-type", "Spaces", "-" } },
})
