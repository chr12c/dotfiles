vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.mouse = 'a'

vim.opt.undofile = false
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.path:append("**")

vim.opt.completeopt:append({ "menuone", "noselect", "fuzzy" })

vim.opt.scrolloff = 1

vim.opt.updatetime = 50

vim.opt.guicursor = ''

vim.opt.listchars = { tab = '» ', trail = '∘' }
vim.opt.list = true

vim.opt.colorcolumn = "80"

--netrw defaults excluding 'nonu', so falls back to vim number settings
vim.g.netrw_bufsettings = 'noma nomod nowrap ro nobl'
