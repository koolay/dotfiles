--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
--
-- general
-- lvim.log.level = "debug"
lvim.log.override_notify = true
lvim.builtin.nvimtree.active = false -- using neo-tree
-- enable treesitter integration
lvim.builtin.treesitter.matchup.enable = true

-- {{ cmp
local cmp = require("cmp")

lvim.builtin.cmp.mapping["<CR>"] = cmp.mapping.confirm({
  behavior = cmp.ConfirmBehavior.Replace,
  select = true,
})

-- {{ luasnip

lvim.builtin.luasnip = {
  sources = {
    friendly_snippets = false,
  },
}
-- }}

-- Ensure telescope shows full path to files.
lvim.builtin.telescope.defaults.path_display = { "absolute" }
-- We want a bigger telescope window
lvim.builtin.telescope.defaults.layout_config.width = 0.99

lvim.format_on_save = {
  enabled = true,
  ---@usage pattern string pattern used for the autocommand (Default: '*')
  pattern = "*.go,*.js,*.ts,*.rs,*.md,*.lua,*.json,*.proto,*.sql,*.html,*.py,*.php",
  ---@usage timeout number timeout in ms for the format request (Default: 1000)
  timeout = 5000,
}

lvim.lint_on_save = true
lvim.line_wrap_cursor_movement = true

-- lvim.builtin.dap.active = true

lvim.builtin.lualine.options.theme = "gruvbox-material"
vim.g.gruvbox_material_background = "hard"

lvim.colorscheme = "gruvbox-material"
vim.g.colors_name = lvim.colorscheme
-- vim.cmd("colorscheme " .. lvim.colorscheme)

vim.opt.guifont = "JetBrainsMono Nerd Font:h14"

lvim.builtin.treesitter.rainbow.enable = false
lvim.builtin.treesitter.indent = { enable = true, disable = { "go" } }

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = ","
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping

-- {{ neo-tree.nvim
-- https://github.com/nvim-neo-tree/neo-tree.nvim/blob/main/doc/neo-tree.txt
lvim.keys.normal_mode["<C-e>"] = "<Cmd>Neotree toggle show<CR>"
lvim.builtin.which_key.mappings["e"] = { "<cmd>Neotree toggle show<cr>", "Toggle NeoTree" }
-- }}
lvim.keys.normal_mode["U"] = "<Cmd>lua vim.lsp.buf.hover()<CR>"
lvim.keys.normal_mode[" "] = ":noh<CR>"
lvim.keys.normal_mode["<C-p>"] = "<Cmd>Telescope find_files theme=get_ivy<CR>"
lvim.keys.normal_mode["<C-w>"] = "<Cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>"

lvim.keys.normal_mode["<C-q>"] = "<cmd>lua vim.diagnostic.setloclist()<CR>"
lvim.keys.normal_mode["]d"] = "<Cmd>lua vim.diagnostic.goto_next()<CR>"
lvim.keys.normal_mode["[d"] = "<Cmd>lua vim.diagnostic.goto_prev()<CR>"

lvim.keys.insert_mode["<C-j>"] = { "v:lua.tab_complete()", { expr = true } }

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", { expr = true })

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
-- sindrets/diffview.nvim
lvim.builtin.which_key.mappings["g"]["d"] = {
  name = "Diff",
  o = { "<cmd>:DiffviewOpen<cr>", "Show all modified files" },
  c = { "<cmd>:DiffviewClose<cr>", "Close" },
  h = { "<cmd>:VGit buffer_history_preview<cr>", "File History" },
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
  r = {
    "<Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
    "Extract Function",
  },
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

lvim.builtin.which_key.mappings["bs"] = {
  "<cmd>lua require('browse').input_search()<cr>",
  "google search",
}

lvim.builtin.which_key.mappings["bo"] = {
  "<cmd>lua require('browse').open_bookmarks({ bookmarks = require('user.browse') })<cr>",
  "browse bookmarks",
}

-- lvim.keys.normal_mode["<C-F5>"] = "<cmd>:lua require('dap').continue()<CR>"
-- lvim.keys.normal_mode["<F8>"] = "<cmd>:lua require('dap').toggle_breakpoint()<CR>"
-- lvim.keys.normal_mode["<F9>"] = "<cmd>:lua require('dap').step_over()<CR>"
-- lvim.keys.normal_mode["<F10>"] = "<cmd>:lua require('dap').step_into()<CR>"

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
-- lvim.builtin.dashboard.active = true
-- lvim.builtin.alpha.mode = "dashbaord"
-- lvim.builtin.alpha.active = true

-- lvim.builtin.lualine.options.globalstatus = true
-- lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
-- lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.nvimtree.show_icons.git = 0

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
  "sql",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
lvim.lsp.automatic_servers_installation = false
vim.diagnostic.config({ virtual_text = true })
lvim.lsp.default_keybinds = true
vim.diagnostic.config({ underline = true, update_in_insert = false })

-- plugin settings

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pylsp" })

-- lsp-status.nvim {{{
local configure_lsp_status = function()
  local lsp_status = require("lsp-status")

  -- https://github.com/nvim-lua/lsp-status.nvim/issues/7#issuecomment-691056312
  -- use LSP SymbolKinds themselves as the kind labels
  -- local kind_labels_mt = {__index = function (_, k) return k end}
  -- local kind_labels = {}
  -- setmetatable(kind_labels, kind_labels_mt)

  -- lsp_status.register_progress() -- register the progress message handler (use fidget.nvim instead?)

  lsp_status.config({
    diagnostics = false, -- this is displayed in another component
    current_function = true, -- default: true
    indicator_errors = "",
    indicator_warnings = "",
    indicator_info = "",
    indicator_hint = "",
    indicator_ok = "",
    -- component_separator = ' ' .. lvim.builtin.lualine.options.component_separators.left .. ' ',
    -- show_filename = true,
    kind_labels = {
      Text = "",
      Method = "ƒ",
      Function = "",
      Constructor = "",
      Variable = "",
      Class = "",
      Interface = "ﰮ",
      Module = "",
      Property = "",
      Unit = "",
      Value = "",
      Enum = "了",
      Keyword = "",
      Snippet = "﬌",
      Color = "",
      File = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "",
    },
    status_symbol = "ʪ",
  })
end
-- }}}

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
--
--
-- https://github.com/OmniSharp/omnisharp-roslyn/issues/2483
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local function toSnakeCase(str)
      return string.gsub(str, "%s*[- ]%s*", "_")
    end

    if client.name == "omnisharp" then
      local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
      for i, v in ipairs(tokenModifiers) do
        tokenModifiers[i] = toSnakeCase(v)
      end
      local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
      for i, v in ipairs(tokenTypes) do
        tokenTypes[i] = toSnakeCase(v)
      end
    end
  end,
})

-- Additional Plugins
lvim.plugins = {
  { "lewis6991/impatient.nvim" },
  { "sainnhe/gruvbox-material" },
  { "tpope/vim-surround" },
  { "nvim-treesitter/nvim-treesitter-refactor" },
  { "godlygeek/tabular" },
  -- { "rrethy/vim-hexokinase", build = "make hexokinase" },
  { "nvim-telescope/telescope-live-grep-args.nvim" },
  {
    "nvim-lua/lsp-status.nvim",
    event = "BufEnter",
    config = configure_lsp_status,
    before = "lualine.nvim",
    after = "nvim-lspconfig",
  }, -- show current lsp context in statusbar e.g. function I'm in
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
  { "github/copilot.vim" },
  {
    "Exafunction/codeium.vim",
    config = function()
      require("user.codeium").setup()
    end,
  },
  ---  high cpu usage..!!!
  -- {
  --   "tzachar/cmp-tabnine",
  --   config = function()
  --     local tabnine = require("cmp_tabnine.config")
  --     tabnine:setup({
  --       run_on_every_keystroke = true,
  --       max_lines = 1000,
  --       max_num_results = 20,
  --       sort = true,
  --     })
  --   end,

  --   build = "./install.sh",
  --   dependencies = "hrsh7th/nvim-cmp",
  -- },
  -- Easymotion like navigation
  {
    "phaazon/hop.nvim",
    name = "hop",
    event = "BufRead",
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end,
  },
  -- match-up(better %) 是一个插件，可让您突出显示,导航和操作匹配文本集.
  -- 它将 vim 的 % 键扩展到特定于语言的单词，而不仅仅是单个字符
  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    branch = "master",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },

    config = function()
      require("refactoring").setup({
        -- prompt for return type
        prompt_func_return_type = {
          go = true,
          java = true,
        },
        -- prompt for function parameters
        prompt_func_param_type = {
          go = true,
          java = true,
        },
      })
    end,
  },
  -- Preview markdown in browser
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  -- Find & Replace
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup({
        color_devicons = true,
        live_update = true,
      })
    end,
  },
  -- debugger
  {
    "vim-test/vim-test",
    config = function()
      vim.g["test#go#runner"] = "gotest"
    end,
  },
  -- generate unitest for golang
  {
    "yasudanaoya/gotests-nvim",
    ft = "go",
    config = function()
      require("gotests").setup()
    end,
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-go",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-go"),
        },
      })
    end,
  },
  {
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup()
    end,
    -- dependencies   = { "mfussenegger/nvim-dap" },
  },
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   config = function()
  --     require("dapui").setup({
  --       icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  --       mappings = {
  --         -- Use a table to apply multiple mappings
  --         expand = { "<CR>", "<2-LeftMouse>" },
  --         open = "o",
  --         remove = "d",
  --         edit = "e",
  --         repl = "r",
  --         toggle = "t",
  --       },
  --     })
  --   end,
  --   ft = { "python", "rust", "go" },
  -- },
  { "theHamsta/nvim-dap-virtual-text" },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
    dependencies = "nvim-lua/plenary.nvim",
  },
  -- Show variables, functions in a buffer
  {
    "koolay/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    config = function()
      require("symbols-outline").setup({
        show_guides = true,
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
  { "tpope/vim-sleuth" },
  {
    "tanvirtin/vgit.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      require("vgit").setup({
        settings = {
          live_blame = {
            enabled = false,
          },
        },
      })
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = { "BufRead", "BufNew" },
    config = function()
      require("user.lsp_signature").config()
    end,
  },
  {
    "jjo/vim-cue",
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = "nvim-treesitter/nvim-treesitter",
  },
  {
    "declancm/cinnamon.nvim",
    config = function()
      require("cinnamon").setup()
    end,
  },
  { "honza/vim-snippets" },
  { "mattn/vim-goaddtags" },
  {
    "earthly/earthly.vim",
  },
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("numb").setup({
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
      })
    end,
  },
  { "kevinhwang91/nvim-bqf" },
  {
    "simrat39/inlay-hints.nvim",
    config = function()
      require("inlay-hints").setup({
        only_current_line = true,
        eol = {
          right_align = true,
        },
      })
    end,
  },
  {
    "terrastruct/d2-vim",
  },
  {
    "lalitmee/browse.nvim",
    config = function()
      require("browse").setup({
        -- search provider you want to use
        provider = "google", -- default
      })
    end,
  },
  {
    -- 基于搜索的导航与快速跳转功能相结合
    -- 1. press s to search
    -- 2. press :xx to jump
    "woosaaahh/sj.nvim",
    config = function()
      local sj = require("sj")
      sj.setup()

      vim.keymap.set("n", "s", sj.run)
      vim.keymap.set("n", "<A-,>", sj.prev_match)
      vim.keymap.set("n", "<A-;>", sj.next_match)
      vim.keymap.set("n", "<localleader>s", sj.redo)
    end,
  },
  {
    "olexsmir/gopher.nvim",
    dependencies = { -- dependencies
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    config = function()
      require("telescope").load_extension("dap")
    end,
  },
  {
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup({
        style = "dark",
        width = 180,
        height = 140,
        width_ratio = 1,
        heigh_ratio = 1,
      })
    end,
    cmd = "Glow",
  },
  {
    -- 基于语法折叠代码块
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup({
        -- Use default keymaps
        -- (<space>m - toggle, <space>j - join, <space>s - split)
        use_default_keymaps = false,

        -- Node with syntax error will not be formatted
        check_syntax_error = true,

        -- If line after join will be longer than max value,
        -- node will not be formatted
        max_join_length = 1024,

        -- hold|start|end:
        -- hold - cursor follows the node/place on which it was called
        -- start - cursor jumps to the first symbol of the node being formatted
        -- end - cursor jumps to the last symbol of the node being formatted
        cursor_behavior = "hold",

        -- Notify about possible problems or not
        notify = true,
        -- langs = langs,

        -- Use `dot` for repeat action
        dot_repeat = true,
      })
      vim.keymap.set("n", "<leader>m", require("treesj").toggle)
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    init = function()
      vim.g.neo_tree_remove_legacy_commands = true
    end,
    config = function()
      require("user.neotree").setup()
    end,
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("user.chatgpt").setup()
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },
  -- {
  --   -- TODO fix
  --   "kevinhwang91/nvim-ufo",
  --   config = function()
  --     require("kevinhwang91/promise-async").setup()
  --     -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
  --     vim.keymap.set("n", "zR", require("ufo").openAllFolds)
  --     vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
  --   end,
  -- },
}

-- local custom_go_actions = require("user.null_ls.go")

-- require("null-ls").setup({
--   sources = {
--     require("null-ls").builtins.formatting.cue_fmt,
--     require("null-ls").builtins.diagnostics.golangci_lint.with({
--       args = { "run", "--fix=false", "--out-format=json", "$DIRNAME", "--path-prefix", "$ROOT" },
--     }),

--     -- -- Custom actions
--     custom_go_actions.gomodifytags,
--     custom_go_actions.gostructhelper,
--   },
-- })

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
