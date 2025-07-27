return {
  "lewis6991/gitsigns.nvim",
  keys = function()
    local gitsigns = require("gitsigns")
    return {
      { "<leader>is", gitsigns.stage_hunk, desc = "Git stage hunk" },
      { "<leader>ir", gitsigns.reset_hunk, desc = "Git reset hunk" },
      {
        "<leader>is",
        mode = "v",
        function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v"), }) end,
        desc = "Git stage highlighted hunk"
      },
      {
        "<leader>ir",
        mode = "v",
        function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v"), }) end,
        desc = "Git reset highlighted hunk"
      },
      { "<leader>iS", gitsigns.stage_buffer, desc = "Git stage buffer" },
      { "<leader>iR", gitsigns.reset_buffer, desc = "Git reset buffer" },
      { "<leader>ip", gitsigns.preview_hunk, desc = "Git preview hunk" },
      { "<leader>ib", gitsigns.blame,        desc = "Git blame" },
      {
        "<leader>iB",
        function() gitsigns.blame_line({ full = true }) end,
        desc = "Git blame line"
      },
      { "<leader>id", function() gitsigns.diffthis("@") end,      desc = "Git diff against HEAD" },
      { "<leader>iD", function() gitsigns.diffthis("master") end, desc = "Git diff against master" }
    }
  end,
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
      end
    })
  end
}
