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
  { import = "astrocommunity.completion.copilot-lua-cmp"},


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

  {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.pack.rust" },
    {
      "simrat39/rust-tools.nvim",
      opts = {
        tools = {
          hover_actions = {
            auto_focus = true,
          },
        },
        server = {
          on_attach = function(client, bufnr)
            -- override here. call lsp on attach and then add own custom logic.
            require("astronvim.utils.lsp").on_attach(client, bufnr)
            local rt = require "rust-tools"

            local utils = require "astronvim.utils"

            utils.set_mappings({
              n = {
                ["<leader><leader>r"] = { name = " Rust Tools" },
                ["<leader><leader>rr"] = { rt.hover_actions.hover_actions, desc = "Rust Hover Actions" },
                ["<leader><leader>ra"] = { rt.code_action_group.code_action_group, desc = "Rust Code Actions" },
              },
            }, { buffer = bufnr })
          end,
        },
      },
    },
  }
}
