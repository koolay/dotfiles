
vim.g.did_load_filetypes = 1

--------------------------------------------------------------------------------
-- Diagnostics
--------------------------------------------------------------------------------

vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, border="single"})]]

require "custom.plugins"
require "custom.mappings"
