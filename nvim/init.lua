vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.mouse = "a"
vim.opt.undofile = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.path:append("**")
vim.opt.wildmode="noselect:full"
vim.opt.completeopt:append({ "menuone", "noselect", "fuzzy" })
vim.opt.scrolloff = 1
vim.opt.updatetime = 50
vim.opt.guicursor = ""
vim.opt.listchars = { tab = "» ", trail = "∘" }
vim.opt.list = true
vim.opt.colorcolumn = "80"

vim.g.netrw_bufsettings = "noma nomod nowrap ro nobl"

vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Close tab", silent = true })
vim.keymap.set("n", "<leader>to", ":tabonly<CR>", { desc = "Close all other tabs", silent = true })

local function delete_other_bufs()
  local active_bufs = {}
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    active_bufs[vim.api.nvim_win_get_buf(win)] = true
  end

  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if not active_bufs[buf] and vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
      vim.api.nvim_buf_delete(buf, { force = true })
    end
  end
end

vim.keymap.set(
  "n",
  "<leader>bo",
  delete_other_bufs,
  { desc = "Delete all buffers that are both loaded and listed, unless they are open in any window in any tab" }
)

vim.keymap.set("n", "<M-->", "<C-w>-", { desc = "Decrease current window height" })
vim.keymap.set("n", "<M-=>", "<C-w>+", { desc = "Increase current window height" })
vim.keymap.set("n", "<M-,>", "<C-w><", { desc = "Decrease current window width" })
vim.keymap.set("n", "<M-.>", "<C-w>>", { desc = "Increase current window width" })

vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/NeogitOrg/neogit",
  "https://github.com/sindrets/diffview.nvim",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/scalameta/nvim-metals",
  "https://github.com/mbbill/undotree",
  "https://github.com/tpope/vim-surround",
})
