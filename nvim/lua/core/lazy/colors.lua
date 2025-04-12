return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        styles = {
          italic = false
        }
      })
    end
  },
  {
    "maxmx03/solarized.nvim",
    name = "solarized",
    config = function()
      require("solarized").setup({
        variant = "spring"
      })
      vim.cmd("colorscheme solarized")
      vim.o.background = 'light'
    end
  }
}
