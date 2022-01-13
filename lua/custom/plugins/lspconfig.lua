local M = {}

M.setup_lsp = function(attach, capabilities)
  local util = require("lspconfig.util")
  local lspconfig = require("lspconfig")

  lspconfig.gopls.setup({
    on_attach = function(client)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
    end,
  })

  -- lspconfig.pylsp.setup{
  --   settings = {
  --     pylsp = {
  --       plugins = {
  --         pycodestyle = { enabled = false },
  --         pyflakes = { enabled = false },
  --         pylint = {
  --           enabled = true,
  --           args = { "--max-line-length=120", }
  --         },
  --       }}}}

  lspconfig.bashls.setup({})
  lspconfig.cssls.setup({})
  lspconfig.html.setup({})
  lspconfig.eslint.setup({})
  lspconfig.svelte.setup({})

  -- lspconfig.diagnosticls.setup {
  --   filetypes = {"python"},
  --   init_options = {
  --     formatters = {
  --       black = {
  --         command = "black",
  --         args = {"--line-length", "120", "--quiet", "-"},
  --         rootPatterns = {"pyproject.toml"},
  --       },
  --       formatFiletypes = {
  --         python = {"black"}
  --       }
  --     }
  --   }
  -- }
  --
  lspconfig.tsserver.setup({
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
    end,
  })
end

return M
