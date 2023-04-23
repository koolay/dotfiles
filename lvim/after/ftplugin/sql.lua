lvim.format_on_save = true

-- local Log = require("lvim.core.log")
-- local linters = require("lvim.lsp.null-ls.linters")
local formatters = require("lvim.lsp.null-ls.formatters")
-- Log:error()
formatters.setup({
  {
    command = "sql-formatter",
    filetypes = { "sql" },
  },
})
-- linters.setup({
--   { command = "sqlfluff", filetypes = { "sql" } },
-- })
