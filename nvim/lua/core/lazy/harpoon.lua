return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = function()
    local harpoon = require("harpoon")
    return {
      { "<leader>ha", function() harpoon:list():add() end,     desc = "Add file to harpoon" },
      {
        "<leader>ht",
        function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
        desc = "Toggle harpoon"
      },
      { "<leader>h1", function() harpoon:list():select(1) end, desc = "Select 1st harpoon item" },
      { "<leader>h2", function() harpoon:list():select(2) end, desc = "Select 2nd harpoon item" },
      { "<leader>h3", function() harpoon:list():select(3) end, desc = "Select 3rd harpoon item" },
      { "<leader>h4", function() harpoon:list():select(4) end, desc = "Select 4th harpoon item" },
      { "<leader>hp", function() harpoon:list():prev() end,    desc = "Select previous harpoon item" },
      { "<leader>hn", function() harpoon:list():next() end,    desc = "Select next harpoon item" }
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
