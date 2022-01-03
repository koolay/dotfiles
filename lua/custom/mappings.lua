
local hooks = require "core.hooks"

hooks.add("setup_mappings", function(map)
    local opts = { noremap=true, silent=true }

    -- https://github.com/neovim/nvim-lspconfig

    map("n", "<C-p>", ":Telescope find_files<CR>", opts)
    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    map("n", "U", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

    map("n", "ge", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
    map('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

    map("n", "<leader>gs", ":G<CR>", opts)
    map("n", "<leader>gb", ":G blame<CR>", opts)
    map("n", "<leader>t", ":TroubleToggle<CR>", opts)
 end)
