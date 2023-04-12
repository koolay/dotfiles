local linters = require("lvim.lsp.null-ls.linters")
local formatters = require("lvim.lsp.null-ls.formatters")
linters.setup({
  { command = "buf", filetypes = { "proto" } },
})
formatters.setup({
  { command = "buf", filetypes = { "proto" } },
})
