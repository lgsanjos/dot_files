return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.note-taking.neorg" },
  { import = "astrocommunity.code-runner.sniprun" },

  { import = "astrocommunity.editing-support.refactoring-nvim"},
  { import = "astrocommunity.diagnostics.trouble-nvim"},
  { import = "astrocommunity.editing-support.mini-splitjoin"},
  { import = "astrocommunity.editing-support.refactoring-nvim"},


  { import = "astrocommunity.colorscheme.kanagawa-nvim", enabled = true },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "ray-x/lsp_signature.nvim",
      opts = {
        hint_enable = false, -- disable hints as it will crash in some terminal
      },
    },
  },

  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = 120,
      disabled_filetypes = { "help" },
    },
  },
}
