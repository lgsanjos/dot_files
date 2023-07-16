return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.motion.harpoon" },
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.note-taking.neorg" },
  { import = "astrocommunity.code-runner.sniprun" },
  { import = "astrocommunity.diagnostics.lsp_lines-nvim" },

  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = 120,
      disabled_filetypes = { "help" },
    },
  },
}
