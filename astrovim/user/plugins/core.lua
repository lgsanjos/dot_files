return {
  { "goolord/alpha-nvim",      enabled = false },
  { "akinsho/toggleterm.nvim", opts = { terminal_mappings = false } },
  { "rcarriga/nvim-notify",    opts = { timeout = 0 } },
  {
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = { "javascript" }
    }
  },
}
