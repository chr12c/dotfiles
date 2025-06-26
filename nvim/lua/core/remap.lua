vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab", silent = true })
vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Close all other tabs", silent = true })

vim.keymap.set("n", "<M-->", "<C-w>-", { desc = "Decrease current window height" })
vim.keymap.set("n", "<M-=>", "<C-w>+", { desc = "Increase current window height" })
vim.keymap.set("n", "<M-,>", "<C-w><", { desc = "Decrease current window width" })
vim.keymap.set("n", "<M-.>", "<C-w>>", { desc = "Increase current window width" })
