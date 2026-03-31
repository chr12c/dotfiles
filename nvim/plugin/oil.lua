require("oil").setup({
  columns = {
    "icon",
    "permissions",
    "size",
    "mtime",
  },
  view_options = {
    show_hidden = true,
  },
})

vim.keymap.set("n", "<leader>e", require("oil").open, { desc = "Open oil in parent dir of current buffer or cwd if not a file" })
vim.keymap.set("n", "<leader>E", function() require("oil").open(vim.fn.getcwd()) end, { desc = "Open oil in cwd" })
