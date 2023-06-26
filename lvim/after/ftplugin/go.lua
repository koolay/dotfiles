vim.list_extend(lvim.plugins, { { "leoluz/nvim-dap-go" }, { "olexsmir/gopher.nvim" } })
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "gopls" })

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    command = "goimports",
    filetypes = { "go" },
  },
  {
    command = "goimports-reviser",
    filetypes = { "go" },
    extra_args = { "-rm-unused", "-set-alias" },
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

local lsp_manager = require("lvim.lsp.manager")
lsp_manager.setup("golangci_lint_ls", {
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
})

lsp_manager.setup("gopls", {
  on_attach = function(client, bufnr)
    require("lvim.lsp").common_on_attach(client, bufnr)
    local _, _ = pcall(vim.lsp.codelens.refresh)
  end,
  on_init = require("lvim.lsp").common_on_init,
  capabilities = require("lvim.lsp").common_capabilities(),
  settings = {
    gopls = {
      usePlaceholders = true,
      gofumpt = true,
      codelenses = {
        generate = false,
        gc_details = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
      },
      completeUnimported = true,
      staticcheck = true,
      semanticTokens = true,
    },
  },
})

local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
  {
    command = "proselint",
    args = { "--json" },
  },
})

local status_ok, gopher = pcall(require, "gopher")
if not status_ok then
  return
end

gopher.setup({
  commands = {
    go = "go",
    gomodifytags = "gomodifytags",
    gotests = "gotests",
    impl = "impl",
    iferr = "iferr",
  },
})

local dap_ok, dapgo = pcall(require, "dap-go")
if not dap_ok then
  return
end

dapgo.setup()
