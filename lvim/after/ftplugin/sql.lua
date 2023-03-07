lvim.format_on_save = true

-- local linters = require("lvim.lsp.null-ls.linters")
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    command = "sql-formatter",
    filetypes = { "sql" },
    extra_args = {
      "-l",
      "mysql",
      -- "-c",
      -- vim.env.HOME .. "/.sql-formatter.json",
    },
  },
})
-- linters.setup({
--   { command = "sqlfluff", filetypes = { "sql" } },
-- })
