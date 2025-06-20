return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>ee", function()
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "fugitive" then
            return vim.api.nvim_win_close(win, false) -- Close if open
          end
        end
        vim.cmd.Git() -- Open if not open
      end,
      { desc = "Toggle Git status" }
    )

    vim.keymap.set(
      "n",
      "<leader>ed",
      function() vim.cmd("Gvdiffsplit") end,
      { desc = "Git diff against index or work tree" }
    )

    vim.keymap.set(
      "n",
      "<leader>eD",
      function() vim.cmd("Gvdiffsplit !~") end,
      { desc = "Git diff against last commit" }
    )
  end
}
