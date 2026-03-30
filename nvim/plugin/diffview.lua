vim.keymap.set("n", "<leader>wd", function() require("diffview").open() end, { desc = "Open diffview against HEAD" })
vim.keymap.set("n", "<leader>wD", function() require("diffview").open("master") end, { desc = "Open diffview against master" })
