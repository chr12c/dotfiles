vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.opt.smartindent = true

vim.opt.mouse = 'a'

vim.opt.undofile = false
vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.incsearch = true

vim.opt.scrolloff = 1

--allows faster vim-gitgutter response
vim.opt.updatetime = 50

vim.opt.guicursor = 'a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175'

vim.opt.listchars = 'trail:∘'
vim.opt.list = true

--netrw defaults excluding 'nonu', so falls back to vim number settings
vim.g.netrw_bufsettings = 'noma nomod nowrap ro nobl'

vim.cmd.highlight('SignColumn ctermbg=none')
