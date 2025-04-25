return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require('tiny-inline-diagnostic').setup()
      vim.diagnostic.config({ virtual_text = false }) -- Only if needed in your configuration, if you already have native LSP diagnostics
    end

  -- {
  --   "folke/trouble.nvim",
  --   config = function()
  --     require("trouble").setup({
  --       icons = false,
  --     })
  --
  --     vim.keymap.set("n", "<leader>tt", function()
  --       require("trouble").toggle()
  --     end)
  --
  --     vim.keymap.set("n", "[t", function()
  --       require("trouble").next({skip_groups = true, jump = true});
  --     end)
  --
  --     vim.keymap.set("n", "]t", function()
  --       require("trouble").previous({skip_groups = true, jump = true});
  --     end)
  --
  --   end
  -- },
}
