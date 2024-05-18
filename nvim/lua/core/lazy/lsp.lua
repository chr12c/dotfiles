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
  },
  config = function()
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
  end
}
