
local hooks = require "core.hooks"

hooks.add("setup_mappings", function(map)
    map("n", "<leader>cc", "dd", opt) -- example to delete the buffer
    map("n", "<C-p>", ":Telescope find_files<CR>")
    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
    map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
    map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
    map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
    map("n", "ge", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
    map("n", "gh", "<cmd>lua vim.lsp.diagnostic.disable()<CR>")
    map("n", "gs", "<cmd>lua vim.lsp.diagnostic.enable()<CR>")
    map("n", "<leader>gs", ":G<CR>")
    map("n", "<leader>gb", ":G blame<CR>")
    map("n", "<leader>t", ":TroubleToggle<CR>")
 end)
