--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "debug"
lvim.log.override_notify = true
lvim.builtin.nvimtree.highlight_opened_files = 1

-- Ensure telescope shows full path to files.
lvim.builtin.telescope.defaults.path_display = { "absolute" }

-- We want a bigger telescope window
lvim.builtin.telescope.defaults.layout_config.width = 0.9

lvim.format_on_save = {
  ---@usage pattern string pattern used for the autocommand (Default: '*')
  -- pattern = "*",
  ---@usage timeout number timeout in ms for the format request (Default: 1000)
  timeout = 5000,
}

lvim.lint_on_save = true
lvim.line_wrap_cursor_movement = true

lvim.builtin.dap.active = true

lvim.builtin.lualine.options.theme = "gruvbox-material"
vim.g.gruvbox_material_background = "hard"
lvim.colorscheme = "gruvbox-material"

vim.opt.guifont = "JetBrainsMono Nerd Font:h14"

lvim.builtin.treesitter.rainbow.enable = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = ","
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping

lvim.keys.normal_mode[",e"] = "NvimTreeToggle<CR>"
lvim.keys.normal_mode["U"] = "<Cmd>lua vim.lsp.buf.hover()<CR>"
lvim.keys.normal_mode[" "] = ":noh<CR>"
lvim.keys.normal_mode["<C-p>"] = "<Cmd>Telescope find_files theme=get_ivy<CR>"
lvim.keys.normal_mode["<C-w>"] = "<Cmd>Telescope live_grep<CR>"

lvim.keys.normal_mode["<C-q>"] = "<cmd>lua vim.diagnostic.setloclist()<CR>"
lvim.keys.normal_mode["]d"] = "<Cmd>lua vim.diagnostic.goto_next()<CR>"
lvim.keys.normal_mode["[d"] = "<Cmd>lua vim.diagnostic.goto_prev()<CR>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }
--
--
lvim.builtin.which_key.mappings["g"]["d"] = {
  name = "Diff",
  o = { "<cmd>:DiffviewOpen<cr>", "Show all modified files" },
  c = { "<cmd>:DiffviewClose<cr>", "Close" },
  h = { "<cmd>:DiffviewFileHistory<cr>", "File History" },
  p = { "<cmd>:DiffviewFileHistory . <cr>", "Project History" },
  f = { "<cmd>:DiffviewToggleFiles<cr>", "Toggle Files" },
  r = { "<cmd>:DiffviewRefresh<cr>", "Refresh" },
}

lvim.builtin.which_key.mappings["l"]["o"] = { "<cmd>SymbolsOutline<cr>", "Outline" }
lvim.builtin.which_key.mappings["f"] = {
  name = "hop (easy motion)",
  w = { "<cmd>HopWord<CR>", "HopWord" },
  l = { "<cmd>HopLine<CR>", "HopLine" },
  f = { "<cmd>HopChar2<CR>", "HopChar2" },
}

lvim.builtin.which_key.mappings["r"] = {
  name = "Replace",
  r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
  w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
}

lvim.builtin.which_key.vmappings["v"] = {
  name = "Refactoring",
  r = { "<Cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract Function" },
}

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  l = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<CR>", "Diagnostics" },
}

-- dap debugger mappings
lvim.builtin.which_key.mappings["dU"] = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle Debugger UI" }
lvim.builtin.which_key.mappings["de"] = { "<cmd>lua require('dapui').eval()<cr>", "Eval" }
lvim.builtin.which_key.mappings["dB"] = {
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  "Add breakpoint condition",
}
lvim.builtin.which_key.mappings["dl"] = {
  "<cmd>lua require'dap'.list_breakpoints() vim.fn.QuickFixToggle() <CR>",
  "Toggle breakpoints list",
}

-- lvim.keys.normal_mode["<C-F5>"] = "<cmd>:lua require('dap').continue()<CR>"
-- lvim.keys.normal_mode["<F8>"] = "<cmd>:lua require('dap').toggle_breakpoint()<CR>"
-- lvim.keys.normal_mode["<F9>"] = "<cmd>:lua require('dap').step_over()<CR>"
-- lvim.keys.normal_mode["<F10>"] = "<cmd>:lua require('dap').step_into()<CR>"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 0

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
lvim.lsp.automatic_servers_installation = true
lvim.lsp.diagnostics.virtual_text = true
lvim.lsp.default_keybinds = true
lvim.lsp.diagnostics.update_in_insert = false
lvim.lsp.diagnostics.underline = true

-- plugin settings

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pylsp" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
local opts = {} -- check the lspconfig documentation for a list of all possible options
require("lvim.lsp.manager").setup("pylsp", opts)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- set a formatter, this will override the language server formatting capabilities (if it exists)
-- see <https://www.lunarvim.org/languages/#multi-languages-per-formatter>

-- Additional Plugins
lvim.plugins = {
  { "lewis6991/impatient.nvim" },
  { "sainnhe/gruvbox-material" },
  { "tpope/vim-surround" },
  { "godlygeek/tabular" },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "tzachar/cmp-tabnine",
    config = function()
      local tabnine = require("cmp_tabnine.config")
      tabnine:setup({
        max_lines = 1000,
        max_num_results = 20,
        sort = true,
      })
    end,

    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
  },
  -- Easymotion like navigation
  {
    "phaazon/hop.nvim",
    as = "hop",
    event = "BufRead",
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end,
  },
  -- better %
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",

    config = function()
      require("refactoring").setup()
    end,
  },
  -- Preview markdown in browser
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  -- Find & Replace
  {
    "windwp/nvim-spectre",
    event = "BufRead",
  },
  -- debugger
  { "vim-test/vim-test" },
  { "rcarriga/vim-ultest", requires = { "vim-test/vim-test" }, run = ":UpdateRemotePlugins" },
  {
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup()
    end,
    requires = { "mfussenegger/nvim-dap" },
  },
  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()
    end,
    ft = { "python", "rust", "go" },
    requires = { "mfussenegger/nvim-dap" },
    disable = false,
  },
  { "theHamsta/nvim-dap-virtual-text" },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
    requires = "nvim-lua/plenary.nvim",
  },
  -- Show variables, functions in a buffer
  {
    "koolay/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    config = function()
      require("symbols-outline").setup({
        relative = false,
        -- Get a wider sidebar for SymbolsOutline, min 40 columns on smaller screens.
        width = math.ceil(math.min(vim.o.columns, math.max(40, vim.o.columns / 6))),
        -- No preview by default
        auto_preview = false,
        keymaps = { -- These keymaps can be a string or a table for multiple keys
          close = { "<Esc>", "q" },
          goto_location = "<Cr>",
          focus_location = "o",
          hover_symbol = "<C-space>",
          toggle_preview = "K",
          rename_symbol = "r",
          code_actions = "a",
        },
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    setup = function()
      vim.g.indent_blankline_filetype_exclude = {
        "go",
        "terminal",
        "dashboard",
        "Outline",
      }

      vim.g.indent_blankline_show_trailing_blankline_indent = false
      vim.g.indent_blankline_show_first_indent_level = true
      vim.g.indent_blankline_indent_level = 10
      vim.g.indent_blankline_use_treesitter = true
    end,
  },
  { "tanvirtin/vgit.nvim", requires = "nvim-lua/plenary.nvim" },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end,
  },
}

require("null-ls").setup({
  sources = {
    require("null-ls").builtins.diagnostics.golangci_lint.with({
      args = { "run", "--fix=false", "--out-format=json", "$DIRNAME", "--path-prefix", "$ROOT" },
    }),
  },
})

lvim.lsp.on_attach_callback = function(client, _)
  require("lsp_signature").on_attach()
  -- volid conflict with null-ls
  if client.name == "gopls" then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
end

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
