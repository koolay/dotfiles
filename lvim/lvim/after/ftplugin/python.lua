local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
  {
    command = "pylint",
    filetypes = { "python" },
    extra_args = { "--max-line-length", "120" },
  },
})

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "black", filetypes = { "python" }, extra_args = { "--line-length", "120" } },
  { command = "isort", filetypes = { "python" } },
})
