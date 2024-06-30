return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons"
  },

  config = function()
    require("telescope").setup({
      defaults = {
        layout_strategy = "vertical",
        layout_config = {
          vertical = {
            preview_cutoff = 0,
            height = 0.95,
            width = 0.95
          },
        }
      },
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = true
        }
      }
    })

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
    vim.keymap.set('n', '<leader>fw', function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set('n', '<leader>fW', function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end)
    vim.keymap.set("n", "<leader>fs", function()
      builtin.grep_string({ search = vim.fn.input("Grep > ") });
    end)
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fm", builtin.marks, {})
  end
}
