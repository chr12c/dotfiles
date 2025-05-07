return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
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
      "rust_analyzer"
    })

    local cmp = require("cmp")
    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        end
      },
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
        { name = "luasnip" }, -- For luasnip users.
      }, {
        { name = "buffer" },
      })
    })
  end
}
