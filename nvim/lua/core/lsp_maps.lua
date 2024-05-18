vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "<leader>go", vim.lsp.buf.type_definition)
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references)
vim.keymap.set("n", "<leader>gs", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<leader>gys", vim.lsp.buf.document_symbol)
vim.keymap.set("n", "<leader>gws", vim.lsp.buf.workspace_symbol)
vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run)
vim.keymap.set("n", "<F2>", vim.lsp.buf.rename)
vim.keymap.set("n", "<F3>", vim.lsp.buf.format)
vim.keymap.set("n", "<F4>", vim.lsp.buf.code_action)

vim.keymap.set("n", "<leader>gl", vim.diagnostic.open_float)

-- all workspace diagnostics
vim.keymap.set("n", "<leader>aa", vim.diagnostic.setqflist)

-- all workspace errors
vim.keymap.set("n", "<leader>ae", function()
  vim.diagnostic.setqflist({ severity = "E" })
end)

-- all workspace warnings
vim.keymap.set("n", "<leader>aw", function()
  vim.diagnostic.setqflist({ severity = "W" })
end)

-- buffer diagnostics only
vim.keymap.set("n", "<leader>db", vim.diagnostic.setloclist)

vim.keymap.set("n", "<leader>[d", function()
  vim.diagnostic.goto_prev({ wrap = false })
end)

vim.keymap.set("n", "<leader>]d", function()
  vim.diagnostic.goto_next({ wrap = false })
end)
