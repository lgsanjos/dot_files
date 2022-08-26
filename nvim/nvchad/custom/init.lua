-- example file i.e lua/custom/init.lua
-- load your options globals, autocmds here or anything .__.
-- you can even override default options here (core/options.lua)

print("hello world")

vim.api.nvim_set_keymap('n', ',w', '<cmd>:w<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', ',q', '<cmd>:bd<CR>', {noremap = true})

vim.api.nvim_set_keymap('n', 'z;', '<cmd>:bn<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', 'zj', '<cmd>:bp<CR>', {noremap = true})

vim.opt.langmap = "jh,kj,lk,\\;l"
