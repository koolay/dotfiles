return {
  { "sainnhe/gruvbox-material" },
  { "Bekaboo/dropbar.nvim" },
  {
    "onsails/lspkind.nvim",
    opts = function(_, opts)
      -- use codicons preset
      opts.preset = "codicons"
      -- set some missing symbol types
      opts.symbol_map = {
        Array = "",
        Boolean = "",
        Key = "",
        Namespace = "",
        Null = "",
        Number = "",
        Object = "",
        Package = "",
        String = "",
      }
      return opts
    end,
  },
  { "earthly/earthly.vim", ft = "Earthfile" },
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup {
        floating_window = true,
        hint_scheme = "Comment",
        hint_enable = true,
        hi_parameter = "Search",
        hint_prefix = "",
        floating_window_above_cur_line = true,
        fix_pos = true,
      }
    end,
  },
  {
    "dstein64/nvim-scrollview",
    event = "BufRead",
    config = function()
      require("scrollview").setup {
        excluded_filetypes = { "neo-tree" },
        winblend = 30,
        -- base = 'buffer',
        column = 1,
        signs_on_startup = { "all" },
        -- diagnostics_severities = { vim.diagnostic.severity.ERROR }
      }
    end,
  },
}
