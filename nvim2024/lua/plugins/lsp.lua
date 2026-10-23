-- LSP servers, layered onto LazyVim's nvim-lspconfig setup.
-- LazyVim handles mason install, capabilities (via the nvim-cmp extra),
-- keymaps, inlay hints, formatting and diagnostics.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "Lua 5.1" },
              diagnostics = {
                globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
              },
            },
          },
        },
        gopls = {},
        vtsls = {},
        zls = {
          root_markers = { "build.zig", "zls.json", ".git" },
          settings = {
            zls = {
              enable_inlay_hints = true,
              enable_snippets = true,
              warn_style = true,
            },
          },
        },
      },
    },
  },
}
