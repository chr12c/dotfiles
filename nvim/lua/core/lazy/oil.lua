return {
  "stevearc/oil.nvim",
  ---@module "oil"
  ---@type oil.SetupOpts
  opts         = {
    columns = {
      "icon",
      "permissions",
      "size",
      "mtime",
    },
    view_options = {
      show_hidden = true
    }
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy         = false,
  keys         = function()
    return {
      {
        "<leader>oo",
        require("oil").open,
        desc = "Open oil in parent dir of current buffer or cwd if not a file"
      },
      {
        "<leader>op",
        function() require("oil").open(vim.fn.getcwd()) end,
        desc = "Open oil in cwd"
      },
    }
  end
}
