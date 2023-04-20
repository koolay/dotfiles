local M = {}

M.config = function()
  local status_ok, sig = pcall(require, "lsp_signature")
  if not status_ok then
    return
  end

  local cfg = {
    hint_enable = true,
    hi_parameter = "Search",
    floating_window_above_cur_line = true,
    fix_pos = true,
  }
  sig.setup(cfg)
end

return M
