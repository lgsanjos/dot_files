vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", vim.cmd.write);
vim.keymap.set("n", "<leader>q", vim.cmd.bdelete);
vim.keymap.set("n", "<leader>bn", vim.cmd.bnext);
vim.keymap.set("n", "<leader>bp", vim.cmd.bprevious);

vim.keymap.set("n", "<leader>e", "<cmd>Neotree reveal toggle<cr>");

vim.keymap.set("n", "<leader>ck", "<cmd>e ~/.config/nvim/lua/me/remap.lua<cr>");
vim.keymap.set("n", "<leader>cp", "<cmd>e ~/.config/nvim/lua/plugins<cr>");

vim.keymap.set("n", "<leader>ck", "<cmd>e ~/.config/nvim/lua/me/remap.lua<cr>");

vim.keymap.set("n", "<leader>1", "'1");
vim.keymap.set("n", "<leader>2", "'2");
vim.keymap.set("n", "<leader>3", "'3");
vim.keymap.set("n", "<leader>4", "'4");
vim.keymap.set("n", "<leader>5", "'5");

-- PLUGINS --
--

-- live-grep-telescope
vim.keymap.set('n', '<leader>fc', '<cmd>lua require(\'telescope.builtin\').grep_string({search = vim.fn.expand("<cword>")})<cr>', {});
vim.keymap.set('n', '<leader>fw', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', {});

-- GitBlame
vim.keymap.set("n", "<leader>gb", "<cmd>GitBlameToggle<cr>");

-- Twilight
vim.keymap.set("n", "<leader>tt", "<cmd>Twilight<cr>");

vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', {})
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', {})
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', {})
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', {})
vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', {})
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', {})
vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', {})
vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', {})
vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', {})
vim.keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', {})

-- Aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

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
