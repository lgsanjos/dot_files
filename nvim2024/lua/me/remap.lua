vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", vim.cmd.write);
vim.keymap.set("n", "<leader>c", vim.cmd.bdelete);
vim.keymap.set("n", "<leader>bn", vim.cmd.bnext);
vim.keymap.set("n", "<leader>bp", vim.cmd.bprevious);

vim.keymap.set("n", "<leader>e", "<cmd>Neotree reveal toggle<cr>");

vim.keymap.set("n", "<leader>ck", "<cmd>e ~/.config/nvim/lua/me/remap.lua<cr>");
vim.keymap.set("n", "<leader>cp", "<cmd>e ~/.config/nvim/lua/plugins<cr>");

vim.keymap.set("n", "<leader>ck", "<cmd>e ~/.config/nvim/lua/me/remap.lua<cr>");

-- PLUGINS --
--

-- Twilight
vim.keymap.set("n", "<leader>tt", "<cmd>Twilight<cr>");

-- local harpoon = require("harpoon")
-- -- REQUIRED
-- harpoon:setup()
-- -- REQUIRED
-- 
-- vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
-- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
-- 
-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)

-- Telescope config is in after/plugin/telescope.lua
