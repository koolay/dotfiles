local hooks = require("core.hooks")

hooks.add("install_plugins", function(use)
  use("nathom/filetype.nvim")

  use({
    "williamboman/nvim-lsp-installer",
    after = "nvim-lspconfig",
    config = function()
      local lsp_installer = require("nvim-lsp-installer")

      lsp_installer.on_server_ready(function(server)
        local opts = {}

        if server.name == "sumneko_lua" then
          opts.settings = {
            Lua = {
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
              },
              -- Do not send telemetry data containing a randomized but unique identifier
              telemetry = {
                enable = false,
              },
            },
          }
        elseif server.name == "pylsp" then
          -- opts.settings = {
          --         pylsp = {
          --                 plugins = {
          --                         pydocstyle = {
          --                           enabled = false,
          --                         },
          --                         pycodestyle = {
          --                           enabled = false,
          --                         },
          --                         pyflakes = {
          --                           enabled = false,
          --                         },
          --                         pylint = {
          --             enabled = true,
          --             args = { "--max-line-length=120", }
          --                  },
          --                         pylsp_black = {
          --                           line_length = 120,
          --                         },
          --                 },
          --         },
          -- }
        end

        server:setup(opts)
        vim.cmd([[ do User LspAttachBuffers ]])
      end)
    end,
  })

  use({
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascriptreact" },
    after = "nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  })

  use({
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls").setup()
    end,
  })

  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn install",
    ft = "markdown",
  })

  use({
    "karb94/neoscroll.nvim",
    opt = true,
    config = function()
      require("neoscroll").setup()
    end,

    -- lazy loading
    setup = function()
      require("core.utils").packer_lazy_load("neoscroll.nvim")
    end,
  })

  use({
    "nvim-telescope/telescope-media-files.nvim",
    after = "telescope.nvim",
    config = function()
      require("telescope").setup()
      require("telescope").load_extension("media_files")
    end,
  })

  use({
    "tpope/vim-surround",
  })

  use({
    "godlygeek/tabular",
  })

  use({
    "tpope/vim-fugitive",
  })
end)
