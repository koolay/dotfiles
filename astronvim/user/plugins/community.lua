return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  {
    import = "astrocommunity.colorscheme.kanagawa-nvim",
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    -- wave,dragon,lotus
    event = "VeryLazy",
    opts = {
      theme = "dragon",
    },
  },

  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.completion.codeium-vim" },
  { import = "astrocommunity.editing-support.treesj" },
  { import = "astrocommunity.editing-support.chatgpt-nvim" },
  -- { import = "astrocommunity.bars-and-lines.dropbar-nvim" },
  { import = "astrocommunity.bars-and-lines.scope-nvim" },
  { import = "astrocommunity.project.project-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.utility.telescope-live-grep-args-nvim" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.motion.vim-matchup" },
  { import = "astrocommunity.motion.grapple-nvim" },
  { import = "astrocommunity.editing-support.refactoring-nvim" },
  { import = "astrocommunity.note-taking.obsidian-nvim" },
  { import = "astrocommunity.scrolling.neoscroll-nvim" },
  { import = "astrocommunity.test.neotest" },
  -- { import = "astrocommunity.workflow.hardtime-nvim" },
  {
    "m4xshen/hardtime.nvim",
    event = "User AstroFile",
    opts = {
      -- Maximum count of repeated key presses allowed within the max_time period.
      max_count = 4,
      restriction_mode = "hint", -- block or hint
      disabled_keys = {
        ["<Insert>"] = { "", "i" },
        ["<Home>"] = { "", "i" },
        ["<End>"] = { "", "i" },
        ["<PageUp>"] = { "", "i" },
        ["<PageDown>"] = { "", "i" },
        ["<Up>"] = {},
        ["<Down>"] = {},
        ["<Left>"] = {},
        ["<Right>"] = {},
      },
      disabled_filetypes = {
        "qf",
        "neo-tree",
        "lazy",
        "mason",
        "NeogitStatus",
        "lspinfo",
        "null-ls-info",
      },
      restricted_keys = {
        ["j"] = {},
        ["k"] = {},
      },
    },
    config = function(_, opts)
      require("hardtime").setup(opts)
      require("hardtime").enable()
    end,
  },
}
