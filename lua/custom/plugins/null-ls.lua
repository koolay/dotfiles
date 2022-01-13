local null_ls = require "null-ls"
local b = null_ls.builtins

local function exist(bin)
	return vim.fn.exepath(bin) ~= ''
end

local sources = {
  b.formatting.trim_newlines,
  b.hover.dictionary,
  b.formatting.prettierd.with { 
  filetypes = 
    { 
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "css",
      "scss",
      "less",
      "html",
      "json",          
      "yaml",
      "markdown",
      "graphql",
    },
  },
   b.formatting.deno_fmt,
   b.diagnostics.eslint.with {
      command = "eslint_d",
   },

   -- golang
   b.formatting.goimports,
   b.formatting.gofumpt,
   b.formatting.golines.with({
        extra_args = {
          "--max-len=120",
          "--base-formatter=gofumpt",
        },
    }),

   b.formatting.sqlformat.with({
      extra_args = function(params)
          return {
                  "--identifiers=lower",
                  "--keywords=upper",
                  "--reindent",
                  "--indent_width=" .. vim.api.nvim_buf_get_option(params.bufnr, "shiftwidth"),
                  "--reindent",
          }
      end,
    }),

   b.formatting.black.with({
     args = { "--line-length", "120" },
   }),

   -- Lua
   b.formatting.stylua.with({
        args = { "--indent-width", "4", "--indent-type", "Spaces", "-" },
   }),

   b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

   -- Shell
   b.formatting.shfmt,
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

   b.code_actions.refactoring,
}

local M = {}

M.setup = function()
   null_ls.setup {
      debug = true,
      sources = sources,
      -- format on save
      on_attach = function(client, bufnr)
        if client.resolved_capabilities.document_formatting then
            vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
        end
      end,
   }
end

return M
