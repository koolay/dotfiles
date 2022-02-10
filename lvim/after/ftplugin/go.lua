vim.opt_local.shiftwidth = 0
vim.opt_local.softtabstop = 0

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
  {
    command = "goimports",
    filetypes = { "go" },
  },
  {
    command = "golines",
    filetypes = { "go" },
    extra_args = {
      "--max-len=120",
      "--base-formatter=gofumpt",
    },
  },
})
