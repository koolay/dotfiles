-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
lvim.format_on_save = true

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

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  { command = "black", filetypes = { "python" }, extra_args = { "--line-length", "120" } },
  { command = "isort", filetypes = { "python" }, extra_args = { "--profile", "black" } },
})

local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
  {
    command = "proselint",
    args = { "--json" },
  },
})
