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

M.telescope = {
  extensions = {
    live_grep_args = {
       auto_quoting = true, -- enable/disable auto-quoting
       -- define mappings, e.g.
       mappings = { -- extend mappings
         i = {
           --["<C-k>"] = lga_actions.quote_prompt(),
           --["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
         },
       },
       -- ... also accepts theme settings, for example:
       -- theme = "dropdown", -- use dropdown theme
       -- theme = { }, -- use own theme spec
       -- layout_config = { mirror=true }, -- mirror preview pane
    }
  }
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
