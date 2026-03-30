require("neogit").setup({
  disable_insert_on_commit = true,
  commit_editor = {
    spell_check = false,
  },
})

vim.keymap.set("n", "<leader>ww", function() require("neogit").open() end, { desc = "Open neogit" })
