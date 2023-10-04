return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    -- local actions = require "telescope.actions"
    return require("astronvim.utils").extend_tbl(opts, {
      pickers = {
        lsp_references = {
          layout_strategy = "vertical",
          show_line = false,
          layout_config = {
            prompt_position = "bottom",
            width = 0.9,
            height = 0.9,
            preview_cutoff = 1,
            mirror = false,
          },
        },
        live_grep = {
          layout_strategy = "vertical",
          layout_config = {
            prompt_position = "bottom",
            width = 0.9,
            height = 0.9,
            preview_cutoff = 1,
            mirror = false,
          },
        },
        lsp_dynamic_workspace_symbols = {
          show_line = false,
          layout_config = {
            horizontal = {
              preview_width = 0.5,
            },
          },
        },
      },
    })
  end,
}
