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
