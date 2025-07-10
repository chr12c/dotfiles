return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("mason").setup({})

    vim.diagnostic.config({ virtual_text = true })
    vim.o.winborder = "single"
    vim.lsp.config.gopls = {
      settings = {
        gopls = {
          buildFlags = { "-tags=unit,integration,decoupled,functional" }
        }
      }
    }
    vim.lsp.enable({
      "gopls",
      "lua_ls",
      "pylsp",
      "rust_analyzer",
      "terraformls",
    })

    local cmp = require("cmp")
    cmp.setup({
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item({ behavior = "select" })
          else
            cmp.complete()
          end
        end),
        ["<C-n>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_next_item({ behavior = "select" })
          else
            cmp.complete()
          end
        end)
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
      })
    })
  end
}
