return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    local cmp = require("cmp")

    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installs = {
        "lua_ls"
      },
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup{}
        end
      }
    })

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        end
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_prev_item({behavior = "select"})
          else
            cmp.complete()
          end
        end),
        ["<C-n>"] = cmp.mapping(function()
          if cmp.visible() then
            cmp.select_next_item({behavior = "select"})
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
