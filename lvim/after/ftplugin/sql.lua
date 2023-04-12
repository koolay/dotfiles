lvim.format_on_save = true

-- local Log = require("lvim.core.log")
local config_file = require("lspconfig/util").root_pattern(".git")
-- local linters = require("lvim.lsp.null-ls.linters")
local formatters = require("lvim.lsp.null-ls.formatters")
-- Log:error()
formatters.setup({
  {
    command = "sql-formatter",
    filetypes = { "sql" },
    extra_args = {
      "-l",
      "mysql",
      "-c",
      ".sql-formatter.json",
    },
  },
})
-- linters.setup({
--   { command = "sqlfluff", filetypes = { "sql" } },
-- })
