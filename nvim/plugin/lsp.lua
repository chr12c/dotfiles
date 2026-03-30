require("mason").setup()

vim.diagnostic.config({ virtual_text = true })
vim.o.winborder = "single"

vim.lsp.config.gopls = {
  settings = {
    gopls = {
      buildFlags = { "-tags=unit,integration,decoupled,functional" },
    },
  },
}

vim.lsp.config.lua_ls = {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
    },
  },
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

    if not client then
      vim.notify("LSP client not found for client ID: " .. ev.data.client_id, vim.log.levels.WARN)
      return
    end

    if client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>gD", function()
  vim.cmd.vsplit()
  vim.lsp.buf.definition()
end, { desc = "Go to definition (vsplit)" })
vim.keymap.set("n", "<leader>go", vim.lsp.buf.type_definition)
vim.keymap.set("n", "<leader>gs", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<leader>gws", vim.lsp.buf.workspace_symbol)
vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run)
vim.keymap.set("n", "<F3>", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>aa", vim.diagnostic.setqflist)

vim.keymap.set("n", "<leader>ae", function()
  vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR })
end)

vim.keymap.set("n", "<leader>aw", function()
  vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.WARN })
end)

vim.keymap.set("n", "<leader>db", vim.diagnostic.setloclist)
