-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

return {
  -- first key is the mode
  n = {
    ["<leader>e"] = { "<cmd> Neotree filesystem toggle left<CR>", desc = "Toggle neo tree" },
    ["<leader>o"] = { "<cmd> Neotree filesystem toggle left<CR>", desc = "Toggle neo tree" },
    -- Harpoon
    ["<leader><leader>1"] = { '<cmd> :lua require("harpoon.ui").nav_file(1)<CR>', desc = "Nav to harpoon 1" },
    ["<leader><leader>2"] = { '<cmd> :lua require("harpoon.ui").nav_file(2)<CR>', desc = "Nav to harpoon 2" },
    ["<leader><leader>3"] = { '<cmd> :lua require("harpoon.ui").nav_file(3)<CR>', desc = "Nav to harpoon 3" },
    ["<leader><leader>4"] = { '<cmd> :lua require("harpoon.ui").nav_file(4)<CR>', desc = "Nav to harpoon 4" },
    ["<leader><leader>s"] = { '<cmd> :lua require("harpoon.mark").toggle_file()<CR><CR>', desc = "Toggle harpoon mark" },

    -- nvim :Neotree filesystem reveal righttmux
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", desc = "Move to window at left" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", desc = "Move to window at down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", desc = "Move to window at up" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", desc = "Move to window at right" },
    -- Test
    ["<leader>rn"] = { "<cmd>TestNearest<cr>", desc = "Run nearest test" },
    ["<leader>rl"] = { "<cmd>TestLast<cr>", desc = "Rerun last test" },
    ["<leader>rf"] = { "<cmd>TestFile<cr>", desc = "Run test file" },
    ["<leader>rg"] = { "<cmd>TestEdit<cr>", desc = "Go to test file" },
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>:bnext<cr>", desc = "Next tab" },
    ["<leader>bp"] = { "<cmd>:bprevious<cr>", desc = "Previous tab" },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers", desc = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
