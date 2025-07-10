vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab", silent = true })
vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Close all other tabs", silent = true })

local function delete_other_bufs()
  local active_bufs = {}
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    active_bufs[vim.api.nvim_win_get_buf(win)] = true
  end

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if not active_bufs[buf] and vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end

vim.keymap.set(
  "n",
  "<leader>bo",
  delete_other_bufs,
  { desc = "Delete all buffers that are both loaded and listed, unless they are open in any window in any tab" }
)

vim.keymap.set("n", "<M-->", "<C-w>-", { desc = "Decrease current window height" })
vim.keymap.set("n", "<M-=>", "<C-w>+", { desc = "Increase current window height" })
vim.keymap.set("n", "<M-,>", "<C-w><", { desc = "Decrease current window width" })
vim.keymap.set("n", "<M-.>", "<C-w>>", { desc = "Increase current window width" })
