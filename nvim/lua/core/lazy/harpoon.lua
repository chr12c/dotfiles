return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = function()
    local harpoon = require("harpoon")
    return {
      { "<leader>ha", function() harpoon:list():add() end },
      { "<leader>ht", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end },
      { "<leader>h1", function() harpoon:list():select(1) end },
      { "<leader>h2", function() harpoon:list():select(2) end },
      { "<leader>h3", function() harpoon:list():select(3) end },
      { "<leader>h4", function() harpoon:list():select(4) end }
    }
  end,
  config = function()
    local harpoon = require("harpoon")
    harpoon.setup()

    harpoon:extend({
      UI_CREATE = function(cx)
        vim.keymap.set("n", "<C-v>", function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-x>", function()
          harpoon.ui:select_menu_item({ split = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-t>", function()
          harpoon.ui:select_menu_item({ tabedit = true })
        end, { buffer = cx.bufnr })
      end,
    })
  end
}
