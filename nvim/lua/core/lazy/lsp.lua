return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "mason-org/mason.nvim",
  },
  config = function()
    require("mason").setup()

    vim.diagnostic.config({ virtual_text = true })
    vim.o.winborder = "single"
    vim.lsp.config.gopls = {
      settings = {
        gopls = {
          buildFlags = { "-tags=unit,integration,decoupled,functional" }
        }
      }
    }

    vim.lsp.config.lua_ls = {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false
          }
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

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method("textDocument/completion") then
          vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
      end
    })
  end
}
