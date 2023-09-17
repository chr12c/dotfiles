vim.g["gitgutter_map_keys"] = 0
vim.cmd([[highlight GitGutterAdd ctermfg=Green ctermbg=none]])
vim.cmd([[highlight GitGutterChange ctermfg=Yellow ctermbg=none]])
vim.cmd([[highlight GitGutterDelete ctermfg=Red ctermbg=none]])

vim.keymap.set('n', '<leader>ip', ':GitGutterPreviewHunk<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>i[', ':GitGutterPrevHunk<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>i]', ':GitGutterNextHunk<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>id', ':GitGutterDiffOrig<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>iu', ':GitGutterUndoHunk<CR>', { noremap = true, silent = true })
