vim.opt_local.shiftwidth = 8
vim.opt_local.softtabstop = 8

-- local linters = require("lvim.lsp.null-ls.linters")
-- linters.setup({
--   {
--     command = "golangci-lint",
--     filetypes = { "go" },
--     args = { "run", "--fix=false", "--out-format=json", "$DIRNAME", "--path-prefix", "$ROOT" },
--   },
-- })

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "gofumpt", filetypes = { "go" } },
  {
    command = "golines",
    filetypes = { "go" },
    extra_args = {
      "--max-len=120",
      "--base-formatter=gofumpt",
    },
  },
})
