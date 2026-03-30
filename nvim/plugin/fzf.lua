require("fzf-lua").setup({
  files = {
    no_ignore = true,
  },
  git = {
    status = {
      actions = {
        ["right"] = false,
        ["left"] = false,
        ["ctrl-h"] = { fn = require("fzf-lua").actions.git_stage, reload = true },
        ["ctrl-l"] = { fn = require("fzf-lua").actions.git_unstage, reload = true },
      },
    },
  },
})

vim.keymap.set("n", "<leader>ff",  function() require("fzf-lua").files() end,          { desc = "Find files in cwd" })
vim.keymap.set("n", "<leader>fb",  function() require("fzf-lua").buffers() end,        { desc = "Open fzf buffers" })
vim.keymap.set("n", "<leader>fo",  function() require("fzf-lua").oldfiles() end,       { desc = "Open fzf oldfiles" })
vim.keymap.set("n", "<leader>ft",  function() require("fzf-lua").treesitter() end,     { desc = "Open fzf treesitter" })
vim.keymap.set("n", "<leader>fqs", function() require("fzf-lua").quickfix_stack() end, { desc = "Open fzf quickfix stack" })
vim.keymap.set("n", "<leader>fl",  function() require("fzf-lua").live_grep() end,      { desc = "Live grep project" })
vim.keymap.set("n", "<leader>fw",  function() require("fzf-lua").grep_cword() end,     { desc = "Search word under cursor" })
vim.keymap.set("n", "<leader>fW",  function() require("fzf-lua").grep_cWORD() end,     { desc = "Search WORD under cursor" })
vim.keymap.set({ "n", "v" }, "<leader>fv", function() require("fzf-lua").grep_visual() end, { desc = "Search visual selection" })
vim.keymap.set("n", "<leader>fg",  function() require("fzf-lua").git_files() end,      { desc = "Find git files in cwd" })
vim.keymap.set("n", "<leader>fGs", function() require("fzf-lua").git_status() end,     { desc = "Open fzf git status" })
vim.keymap.set("n", "<leader>fGS", function() require("fzf-lua").git_stash() end,      { desc = "Open fzf git stash" })
vim.keymap.set("n", "<leader>fGl", function() require("fzf-lua").git_commits() end,    { desc = "Open fzf git commit log (project)" })
vim.keymap.set("n", "<leader>fGc", function() require("fzf-lua").git_bcommits() end,   { desc = "Open fzf git commit log (buffer)" })
vim.keymap.set("n", "<leader>fGb", function() require("fzf-lua").git_branches() end,   { desc = "Open fzf git branches" })
vim.keymap.set("n", "<leader>fGt", function() require("fzf-lua").git_tags() end,       { desc = "Open fzf git tags" })
vim.keymap.set("n", "<leader>fr",  function() require("fzf-lua").resume() end,         { desc = "Resume last fzf command/query" })
vim.keymap.set("n", "<leader>fm",  function() require("fzf-lua").marks() end,          { desc = "Open fzf marks" })
vim.keymap.set("n", "<leader>fR",  function() require("fzf-lua").registers() end,      { desc = "Open fzf registers" })
