------------------------ use omnisharp ---------------------
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "csharp_ls" })
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "omnisharp"
end, lvim.lsp.automatic_configuration.skipped_servers)

require("lvim.lsp.manager").setup("omnisharp", {
  handlers = {
    ["textDocument/definition"] = require("omnisharp_extended").handler,
  },
  organize_imports_on_format = true,
  sdk_include_prereleases = true,
  enable_roslyn_analyzers = true,
  analyze_open_documents_only = false,
  enable_ms_build_load_projects_on_demand = false,
})

--------------------- use csharp_ls ----------------------
-- require("lvim.lsp.manager").setup("csharp_ls", {
--   handlers = {
--     ["textDocument/definition"] = require("csharpls_extended").handler,
--   },
--   enable_editorconfig_support = true,
--   enable_roslyn_analyzers = true,
--   organize_imports_on_format = true,
--   enable_import_completion = true,
-- })

local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
  {
    command = "csharpier",
    filetypes = { "cs" },
  },
})
