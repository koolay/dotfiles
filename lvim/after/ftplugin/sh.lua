local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  {
    command = "shellcheck",
    extra_args = { "--severity", "warning" },
  },
})
