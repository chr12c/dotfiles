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

        -- Navigation
        map("n", "<leader>i]", function()
          if vim.wo.diff then
            vim.cmd.normal({"<leader>i]", bang = true})
          else
            gitsigns.nav_hunk("next")
          end
        end)

        map("n", "<leader>i[", function()
          if vim.wo.diff then
            vim.cmd.normal({"<leader>i[", bang = true})
          else
            gitsigns.nav_hunk("prev")
          end
        end)

        -- Actions
        map("n", '<leader>is', gitsigns.stage_hunk)
        map("n", "<leader>ir", gitsigns.reset_hunk)
        map("v", "<leader>is", function() gitsigns.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end)
        map("v", "<leader>ir", function() gitsigns.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end)
        map("n", "<leader>iS", gitsigns.stage_buffer)
        map("n", "<leader>iu", gitsigns.undo_stage_hunk)
        map("n", "<leader>iR", gitsigns.reset_buffer)
        map("n", "<leader>ip", gitsigns.preview_hunk)
        map("n", '<leader>ib', function() gitsigns.blame_line{full=true} end)
        map("n", '<leader>iB', gitsigns.toggle_current_line_blame)
        -- map("n", "<leader>id", gitsigns.diffthis)
        -- map("n", '<leader>iD', function() gitsigns.diffthis('~') end)
        -- map('n', '<leader>td', gitsigns.toggle_deleted)
      end

    })
  end
}
