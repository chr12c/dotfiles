return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map("n", "<leader>i]", function()
          if vim.wo.diff then
            vim.cmd.normal({ "<leader>i]", bang = true })
          else
            gitsigns.nav_hunk("next")
          end
        end)

        map("n", "<leader>i[", function()
          if vim.wo.diff then
            vim.cmd.normal({ "<leader>i[", bang = true })
          else
            gitsigns.nav_hunk("prev")
          end
        end)

        map("n", "<leader>is", gitsigns.stage_hunk, { desc = "Git stage hunk" })
        map("n", "<leader>ir", gitsigns.reset_hunk, { desc = "Git reset hunk" })
        map("v", "<leader>is",
          function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v"), }) end,
          { desc = "Git stage highlighted hunk" }
        )
        map("v", "<leader>ir",
          function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v"), }) end,
          { desc = "Git reset highlighted hunk" }
        )
        map("n", "<leader>iS", gitsigns.stage_buffer, { desc = "Git stage buffer" })
        map("n", "<leader>iR", gitsigns.reset_buffer, { desc = "Git reset buffer" })
        map("n", "<leader>ip", gitsigns.preview_hunk, { desc = "Git preview hunk" })
        map("n", "<leader>ib", gitsigns.blame, { desc = "Git blame" })
        map("n", "<leader>iB", function() gitsigns.blame_line({ full = true }) end, { desc = "Git blame line" })
        map("n", "<leader>id", function() gitsigns.diffthis("@") end, { desc = "Git diff against HEAD" })
        map("n", "<leader>iD", function() gitsigns.diffthis("master") end, { desc = "Git diff against master" })
      end
    })
  end
}
