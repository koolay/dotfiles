-- try to call custom init
pcall(require, "custom")

local core_modules = {
   "core.options",
   "core.autocmds",
   "core.mappings",
}

for _, module in ipairs(core_modules) do
   local ok, err = pcall(require, module)
   if not ok then
      error("Error loading " .. module .. "\n\n" .. err)
   end
end

-- non plugin mappings
require("core.mappings").misc()


hooks.add("install_plugins", function(use)
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn install",
    ft = "markdown",
  }

  -- 平滑滚动
  use {
    "karb94/neoscroll.nvim",
    opt = true,
    config = function()
      require("neoscroll").setup()
    end,

    -- lazy loading
    setup = function()
      require("core.utils").packer_lazy_load "neoscroll.nvim"
    end,
  }

end)

hooks.add("setup_mappings", function(map)
    map("n", "<leader>cc", "dd", opt) -- example to delete the buffer
 end)
