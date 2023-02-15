-- local linters = require("lvim.lsp.null-ls.linters")
-- linters.setup({
--   {
--     command = "pylint",
--     filetypes = { "python" },
--     extra_args = { "--max-line-length", "120" },
--   },
-- })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
--

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright", "ruff_lsp" })

local lsp_manager = require("lvim.lsp.manager")
lsp_manager.setup("pyright", {
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})

lsp_manager.setup("ruff_lsp", {
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})

-- require("lvim.lsp.manager").setup("ruff_lsp")

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "black", filetypes = { "python" }, extra_args = { "--line-length", "120" } },
  { command = "isort", filetypes = { "python" } },
})
