return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  "andweeb/presence.nvim",
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup()
    end,
  },
  {
    'christoomey/vim-tmux-navigator',
    lazy = false
  },
  {
    'tpope/vim-surround',
    lazy = false
  }

}
