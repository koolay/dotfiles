local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

M.options = {
  mapleader = ",",
}

M.plugins = {
   status = {
      colorizer = true,
      dashboard = true,
   },
   options = {
      nvimtree = {
         enable_git = 0,
      },
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
      default_plugin_config_replace = {
          nvim_treesitter = "custom.plugins.treesitter",
      },
   },

}

M.ui = {
   theme = "gruvchad",
}

return M
