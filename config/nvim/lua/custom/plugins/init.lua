local overrides = require "custom.plugins.overrides"

return {
  ----------------------------------------- default plugins ------------------------------------------

  ["L3MON4D3/LuaSnip"] = {

  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"

      -- relative to current file path:
      -- reload nvim and run :PackerCompile after changing the file path below:
      require "custom.plugins.lspconfig"
    end,
  },

  -- format & linting
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  ["ThePrimeagen/refactoring.nvim"] = {
    after = "nvim-treesitter"
  },
  ["kyazdani42/nvim-tree.lua"] = { override_options = overrides.nvimtree },
  ["nvim-treesitter/nvim-treesitter"] = { override_options = overrides.treesitter },
    -- TODO: mason doesnt seem to pick this config up when running :MasonInstallAll
    -- mason is used to install language servers to your system
    -- run :MasonInstallAll to install the ones listed here
  ["williamboman/mason.nvim"] = { override_options = overrides.mason },
  ["nvim-telescope/telescope.nvim"] = { override_options = overrides.telescope },

  ----------------------------------------- custom plugins ------------------------------------------

  ["nvim-telescope/telescope-live-grep-args.nvim"] = {
    after="telescope.nvim"
  },
  ["easymotion/vim-easymotion"] = {
  },
  ["nvim-neorg/neorg"] = {
  },

  ['simrat39/symbols-outline.nvim'] = {
    after="nvim-treesitter",
    config = function()
      local present, symbolsOutline = pcall(require, "symbols-outline")

      if present then
        symbolsOutline.setup()
      end
    end,
  },
}
