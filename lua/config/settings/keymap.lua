vim.keymap.set('n', 'C-x', [[:close<CR>]], { remap = true })

-- Open and close the terminal blAZinGly FaST
vim.keymap.set('n', '<leader>to', [[:split|term<CR><C-W>J]])
-- If you ever have 99 split buffers open, in a single window, it may be time to go see a doctor
vim.keymap.set('n', '<leader>tc', [[<C-W>99j<C-W><C-Q>]])
-- Quicksave
vim.keymap.set('n', '<leader>ww', [[:w<CR>]])

vim.keymap.set('n', '<leader>tt', '[[:tabnew<CR>]]')
