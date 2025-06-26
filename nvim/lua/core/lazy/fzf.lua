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
  lazy = true,
  keys = function()
    return {
      { "<leader>fl",  function() require("fzf-lua").live_grep() end,    desc = "Live grep project" },
      { "<leader>ff",  function() require("fzf-lua").files() end,        desc = "Find files in cwd" },
      { "<leader>fg",  function() require("fzf-lua").git_files() end,    desc = "Find git files in cwd" },
      { "<leader>fw",  function() require("fzf-lua").grep_cword() end,   desc = "Search word under cursor" },
      { "<leader>fW",  function() require("fzf-lua").grep_cWORD() end,   desc = "Search WORD under cursor" },
      { "<leader>fb",  function() require("fzf-lua").buffers() end,      desc = "Open fzf buffers" },
      { "<leader>fm",  function() require("fzf-lua").marks() end,        desc = "Open fzf marks" },
      { "<leader>ft",  function() require("fzf-lua").treesitter() end,   desc = "Open fzf treesitter" },
      { "<leader>fr",  function() require("fzf-lua").resume() end,       desc = "Resume last fzf command/query" },
      { "<leader>fGs", function() require("fzf-lua").git_status() end,   desc = "Open fzf git status" },
      { "<leader>fGS", function() require("fzf-lua").git_stash() end,    desc = "Open fzf git stash" },
      { "<leader>fGl", function() require("fzf-lua").git_commits() end,  desc = "Open fzf git commit log (project)" },
      { "<leader>fGc", function() require("fzf-lua").git_bcommits() end, desc = "Open fzf git commit log (buffer)" },
      { "<leader>fGb", function() require("fzf-lua").git_branches() end, desc = "Open fzf git branches" },
      { "<leader>fGt", function() require("fzf-lua").git_tags() end,     desc = "Open fzf git tags" },
    }
  end
}
