local M = {}

M.setup_lsp = function(attach, capabilities)


local util = require "lspconfig.util"
local lspconfig = require "lspconfig"

lspconfig.gopls.setup({
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
    end
})

lspconfig.golangci_lint_ls.setup{
    cmd = { "golangci-lint-langserver" },
    filetypes = { "go", "gomod" },
    init_options = {
      command = { "golangci-lint", "run", "--out-format", "json" }
    },
    root_dir = util.root_pattern('go.mod', '.git')
}

lspconfig.bashls.setup({})
lspconfig.cssls.setup({})
lspconfig.html.setup({})
lspconfig.eslint.setup({})
lspconfig.svelte.setup({})

lspconfig.tsserver.setup {
      on_attach = function(client, bufnr)
         client.resolved_capabilities.document_formatting = false
      end,
}

end

return M
