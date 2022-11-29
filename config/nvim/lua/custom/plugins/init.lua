local overrides = require "custom.plugins.overrides"

return {
  ----------------------------------------- default plugins ------------------------------------------

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"

      -- relative to current file path:
      -- reload nvim and run :PackerCompile after changing the file path below:
      require "custom.plugins.lspconfig"
    end,
  },
  ["kyazdani42/nvim-tree.lua"] = { override_options = overrides.nvimtree },
  ["nvim-treesitter/nvim-treesitter"] = { override_options = overrides.treesitter },
    -- TODO: mason doesnt seem to pick this config up when running :MasonInstallAll
    -- mason is used to install language servers to your system
    -- run :MasonInstallAll to install the ones listed here
  ["williamboman/mason.nvim"] = { override_options = overrides.mason },

  ----------------------------------------- custom plugins ------------------------------------------

  ["kelly-lin/telescope-ag"] = {
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