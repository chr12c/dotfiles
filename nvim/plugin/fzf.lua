local fzf = require("fzf-lua")

fzf.setup({
  files = {
    no_ignore = true,
  },
  git = {
    status = {
      actions = {
        ["right"] = false,
        ["left"] = false,
        ["ctrl-h"] = { fn = fzf.actions.git_stage, reload = true },
        ["ctrl-l"] = { fn = fzf.actions.git_unstage, reload = true },
      },
    },
  },
})

vim.keymap.set("n", "<leader>ff", function() fzf.files() end, { desc = "Find files in cwd" })
vim.keymap.set("n", "<leader>fb", function() fzf.buffers() end, { desc = "Open fzf buffers" })
vim.keymap.set("n", "<leader>fo", function() fzf.oldfiles() end, { desc = "Open fzf oldfiles" })
vim.keymap.set("n", "<leader>ft", function() fzf.treesitter() end, { desc = "Open fzf treesitter" })
vim.keymap.set("n", "<leader>fqs", function() fzf.quickfix_stack() end, { desc = "Open fzf quickfix stack" })
vim.keymap.set("n", "<leader>fl", function() fzf.live_grep() end, { desc = "Live grep project" })
vim.keymap.set("n", "<leader>fw", function() fzf.grep_cword() end, { desc = "Search word under cursor" })
vim.keymap.set("n", "<leader>fW", function() fzf.grep_cWORD() end, { desc = "Search WORD under cursor" })
vim.keymap.set({ "n", "v" }, "<leader>fv", function() fzf.grep_visual() end, { desc = "Search visual selection" })
vim.keymap.set("n", "<leader>fg", function() fzf.git_files() end, { desc = "Find git files in cwd" })
vim.keymap.set("n", "<leader>fGs", function() fzf.git_status() end, { desc = "Open fzf git status" })
vim.keymap.set("n", "<leader>fGS", function() fzf.git_stash() end, { desc = "Open fzf git stash" })
vim.keymap.set("n", "<leader>fGl", function() fzf.git_commits() end, { desc = "Open fzf git commit log (project)" })
vim.keymap.set("n", "<leader>fGc", function() fzf.git_bcommits() end, { desc = "Open fzf git commit log (buffer)" })
vim.keymap.set("n", "<leader>fGb", function() fzf.git_branches() end, { desc = "Open fzf git branches" })
vim.keymap.set("n", "<leader>fGt", function() fzf.git_tags() end, { desc = "Open fzf git tags" })
vim.keymap.set("n", "<leader>fr", function() fzf.resume() end, { desc = "Resume last fzf command/query" })
vim.keymap.set("n", "<leader>fm", function() fzf.marks() end, { desc = "Open fzf marks" })
vim.keymap.set("n", "<leader>fR", function() fzf.registers() end, { desc = "Open fzf registers" })
