local M = {}

M.setup = function()
  vim.g.codeium_disable_bindings = 1

  -- Change '<C-g>' here to any keycode you like.
  vim.keymap.set("i", "<C-g>", function()
    return vim.fn["codeium#Accept"]()
  end, { expr = true })
  -- Next suggestion
  vim.keymap.set("i", "<C-;>", function()
    return vim.fn["codeium#CycleCompletions"](1)
  end, { expr = true })
  -- Previous suggestion
  vim.keymap.set("i", "<C-,>", function()
    return vim.fn["codeium#CycleCompletions"](-1)
  end, { expr = true })
  vim.keymap.set("i", "<C-d>", function()
    return vim.fn["codeium#Clear"]()
  end, { expr = true })
end

return M
