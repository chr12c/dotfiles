return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    local actions = require("fzf-lua").actions
    return {
      files = {
        no_ignore = true
      },
      actions = {
        files = {
          true, -- inherit default actions
          ["ctrl-q"] = actions.file_sel_to_qf,
          ["ctrl-l"] = actions.file_sel_to_ll,
        }
      }
    }
  end,
  keys = function()
    local fzf = require("fzf-lua")
    return {
      { "<leader>fl", function() fzf.live_grep() end,  desc = "Live grep project" },
      { "<leader>ff", function() fzf.files() end,      desc = "Find files in cwd" },
      { "<leader>fg", function() fzf.git_files() end,  desc = "Find git files in cwd" },
      { "<leader>fw", function() fzf.grep_cword() end, desc = "Search word under cursor" },
      { "<leader>fW", function() fzf.grep_cWORD() end, desc = "Search WORD under cursor" },
      { "<leader>fb", function() fzf.buffers() end,    desc = "Open fzf buffers" },
      { "<leader>fm", function() fzf.marks() end,      desc = "Open fzf marks" },
      { "<leader>fr", function() fzf.resume() end,     desc = "Resume last fzf command/query" }
    }
  end,
}
