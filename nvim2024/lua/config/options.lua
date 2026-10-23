-- Loaded by LazyVim right after its own lazyvim.config.options, and before the
-- plugin spec is resolved -- so this is the correct place to pin LazyVim's
-- swappable defaults to the choices this config already made.
vim.g.lazyvim_picker = "snacks"     -- fuzzy finder
vim.g.lazyvim_explorer = "neo-tree" -- file explorer (see lua/plugins/neotree.lua)
vim.g.lazyvim_cmp = "nvim-cmp"      -- completion engine (disables blink.cmp)
