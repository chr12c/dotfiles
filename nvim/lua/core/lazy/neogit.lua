return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  lazy = true,
  keys = {
    { "<leader>ww", function() require("neogit").open() end, desc = "Open neogit" }
  },
  opts = {
    disable_insert_on_commit = true,
    commit_editor = {
      spell_check = false
    }
  }
}
