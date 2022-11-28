local M = {}

M.nvimtree = {
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",

    -- web
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "emmet-ls",
  },
}

M.treesitter = {
  ensure_installed = {
    "scss",
    "graphql",
    "ruby",
    "vim",
    "html",
    "css",
    "javascript",
    "json",
    "markdown",
    "bash",
    "lua",
    "norg",
    "typescript",
  },
}

return M
