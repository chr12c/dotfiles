vim.keymap.set("n", "<leader>wd", function()
  vim.ui.input({ prompt = "Diff against ref: ", default = "HEAD" }, function(ref)
    if not ref or ref == "" then return end
    require("diffview").open(ref)
  end)
end, { desc = "Open diffview against a git ref" })
