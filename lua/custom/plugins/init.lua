local hooks = require "core.hooks"

hooks.add("install_plugins", function(use)
   use "nathom/filetype.nvim"

   use {
        "williamboman/nvim-lsp-installer",
        after = "nvim-lspconfig",
        config = function()
            local lsp_installer = require "nvim-lsp-installer"

            lsp_installer.on_server_ready(function(server)
                local opts = {}

                server:setup(opts)
                vim.cmd [[ do User LspAttachBuffers ]]
            end)
        end
    }

   use {
      "windwp/nvim-ts-autotag",
      ft = { "html", "javascriptreact" },
      after = "nvim-treesitter",
      config = function()
         require("nvim-ts-autotag").setup()
      end,
   }

   use {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   }

  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn install",
    ft = "markdown",
  }

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

   use {
      "nvim-telescope/telescope-media-files.nvim",
      after = "telescope.nvim",
      config = function()
         require("telescope").setup {
            extensions = {
               media_files = {
                  filetypes = { "png", "webp", "jpg", "jpeg" },
                  find_cmd = "rg", -- find command (defaults to `fd`)
               },
            },
         }
         require("telescope").load_extension "media_files"
      end,
   }

end)
