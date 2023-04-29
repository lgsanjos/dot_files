-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)

return {
  -- first key is the mode
  n = {
    ["<C-p"] = { "<cmd>e: ~/notes.txt<CR>", desc = "opens notes" },
    -- nvim tmux
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
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
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
