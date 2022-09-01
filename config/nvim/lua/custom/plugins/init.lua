-- My plugins
return {
  ["easymotion/vim-easymotion"] = {

  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"

      -- relative to current file path:
      -- reload nvim and run :PackerCompile after changing the file path below:
      require "custom.plugins.lspconfig"
    end,
  },

    -- TODO: mason doesnt seem to pick this config up when running :MasonInstallAll
    -- mason is used to install language servers to your system
    -- run :MasonInstallAll to install the ones listed here
  ["williamboman/mason.nvim"] = {
    ensure_installed = {
      "lua-language-server",
      "stylua",

      -- web
      "css-lsp",
      "html-lsp",
      "typescript-language-server",

    }
  }
}
