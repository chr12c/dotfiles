return {
  "sindrets/diffview.nvim",
  lazy = true,
  keys = {
    {
      "<leader>wd",
      function() require("diffview").open() end,
      desc = "Open diffview against HEAD"
    },
    {
      "<leader>wD",
      function() require("diffview").open("master") end,
      desc = "Open diffview against master"
    }
  }
}
