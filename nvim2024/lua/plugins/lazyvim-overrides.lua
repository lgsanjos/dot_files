-- Reconcile LazyVim defaults with this config's existing plugins.
return {
  -- `s` is lightspeed's (loaded eagerly in lua/plugins/base.lua); disable flash
  -- so they don't fight over the motion.
  { "folke/flash.nvim", enabled = false },

  -- neo-tree is the explorer (lua/plugins/neotree.lua + vim.g.lazyvim_explorer);
  -- keep snacks' own explorer off.
  { "folke/snacks.nvim", opts = { explorer = { enabled = false } } },

  -- Redundant now that LazyVim provides equivalents.
  { "numToStr/Comment.nvim", enabled = false }, -- `gc` via ts-comments + builtin
  { "stevearc/dressing.nvim", enabled = false }, -- snacks handles vim.ui.*
}
