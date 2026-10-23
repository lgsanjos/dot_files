-- LazyVim v16 uses the nvim-treesitter `main` branch (new API), so the old
-- `require("nvim-treesitter.configs").setup{}` style no longer works.
-- Just extend LazyVim's opts.
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "typescript", "rust", "jsdoc", "templ" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    opts = {
      mode = "cursor",
      max_lines = 0,
      line_numbers = true,
      multiline_threshold = 20,
      trim_scope = "outer",
      zindex = 20,
    },
  },
}
