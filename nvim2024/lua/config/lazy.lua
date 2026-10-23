-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- LazyVim's swappable defaults (picker / explorer / cmp) are pinned in
-- lua/config/options.lua -- that file loads at the right point in LazyVim's init.

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- LazyVim core + its plugin collection
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- LuaSnip instead of the native/nvim-snippets default
    { import = "lazyvim.plugins.extras.coding.luasnip" },
    -- your own plugins
    { import = "plugins" },
  },
  install = { colorscheme = { "nordfox", "habamax" } },
  checker = { enabled = false },
})
