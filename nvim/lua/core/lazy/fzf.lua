return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    local actions = require("fzf-lua").actions
    return {
      files = {
        no_ignore = true
      },
      git = {
        status = {
          actions = {
            ["right"] = false,
            ["left"] = false,
            ["ctrl-h"] = { fn = actions.git_stage, reload = true },
            ["ctrl-l"] = { fn = actions.git_unstage, reload = true },
          }
        }
      }
    }
  end,
  lazy = true,
  keys = function()
    return {
      { "<leader>ff",  function() require("fzf-lua").files() end,          desc = "Find files in cwd" },
      { "<leader>fb",  function() require("fzf-lua").buffers() end,        desc = "Open fzf buffers" },
      { "<leader>fo",  function() require("fzf-lua").oldfiles() end,       desc = "Open fzf oldfiles" },
      { "<leader>ft",  function() require("fzf-lua").treesitter() end,     desc = "Open fzf treesitter" },
      { "<leader>fqs", function() require("fzf-lua").quickfix_stack() end, desc = "Open fzf quickfix stack" },
      { "<leader>fl",  function() require("fzf-lua").live_grep() end,      desc = "Live grep project" },
      { "<leader>fw",  function() require("fzf-lua").grep_cword() end,     desc = "Search word under cursor" },
      { "<leader>fW",  function() require("fzf-lua").grep_cWORD() end,     desc = "Search WORD under cursor" },
      {
        "<leader>fv",
        mode = { "n", "v" },
        function() require("fzf-lua").grep_visual() end,
        desc = "Search visual selection"
      },
      { "<leader>fg",  function() require("fzf-lua").git_files() end,    desc = "Find git files in cwd" },
      { "<leader>fGs", function() require("fzf-lua").git_status() end,   desc = "Open fzf git status" },
      { "<leader>fGS", function() require("fzf-lua").git_stash() end,    desc = "Open fzf git stash" },
      { "<leader>fGl", function() require("fzf-lua").git_commits() end,  desc = "Open fzf git commit log (project)" },
      { "<leader>fGc", function() require("fzf-lua").git_bcommits() end, desc = "Open fzf git commit log (buffer)" },
      { "<leader>fGb", function() require("fzf-lua").git_branches() end, desc = "Open fzf git branches" },
      { "<leader>fGt", function() require("fzf-lua").git_tags() end,     desc = "Open fzf git tags" },
      { "<leader>fr",  function() require("fzf-lua").resume() end,       desc = "Resume last fzf command/query" },
      { "<leader>fm",  function() require("fzf-lua").marks() end,        desc = "Open fzf marks" },
      { "<leader>fR",  function() require("fzf-lua").registers() end,    desc = "Open fzf registers" },
    }
  end
}
