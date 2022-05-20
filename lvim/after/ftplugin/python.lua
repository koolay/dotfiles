-- local linters = require("lvim.lsp.null-ls.linters")
-- linters.setup({
--   {
--     command = "pylint",
--     filetypes = { "python" },
--     extra_args = { "--max-line-length", "120" },
--   },
-- })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
require("lvim.lsp.manager").setup("pylsp", {
  filetypes = { "python" },
  settings = {
    python = {
      linting = {
        flake8Enabled = false,
        pylintEnabled = true,
        mypyEnabled = true,
        pycodestyleEnabled = false,
      },
      analysis = {
        disableOrganizeImports = false,
        autoImportCompletions = true,
        diagnosticMode = "openFilesOnly",
        diagnosticSeverityOverrides = {},
        stubPath = "typings",
        useLibraryCodeForTypes = true,
        autoSearchPaths = true,
      },
    },
  },
})

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "black", filetypes = { "python" }, extra_args = { "--line-length", "120" } },
  { command = "isort", filetypes = { "python" } },
})
