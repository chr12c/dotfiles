return {
  "stevearc/oil.nvim",
  ---@module "oil"
  ---@type oil.SetupOpts
  opts = {},
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  config = function()
    local oil = require("oil")
    oil.setup({
      columns = {
        "icon",
        "permissions",
        "size",
        "mtime",
      },
      view_options = {
        show_hidden = true
      }
    })
    vim.keymap.set(
      "n",
      "<leader>oo",
      oil.open,
      { desc = "Open oil in parent dir of current buffer or cwd if not a file" }
    )
    vim.keymap.set(
      "n",
      "<leader>op",
      function() require("oil").open(vim.fn.getcwd()) end,
      { desc = "Open oil at cwd" })
  end
}
