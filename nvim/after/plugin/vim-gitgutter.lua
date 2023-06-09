vim.g["gitgutter_map_keys"] = 0
vim.cmd([[highlight GitGutterAdd guifg=#009900 ctermfg=Green ctermbg=Black]])
vim.cmd([[highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow ctermbg=Black]])
vim.cmd([[highlight GitGutterDelete guifg=#ff2222 ctermfg=Red ctermbg=Black]])

vim.keymap.set('n', '<leader>ip', ':GitGutterPreviewHunk<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>i[', ':GitGutterPrevHunk<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>i]', ':GitGutterNextHunk<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>id', ':GitGutterDiffOrig<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>iu', ':GitGutterUndoHunk<CR>', { noremap = true, silent = true })
