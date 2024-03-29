local M = {}

M.disabled = {
  n = {
  }
}

M.general = {
  i = {
    -- navigate within insert mode
    ["<C-j>"] = { "<Left>", "move left" },
    ["<C-k>"] = { "<Down>", "move down" },
    ["<C-l>"] = { "<Up>", "move up" },
    ["<C-;>"] = { "<Right>", "move right" },
  },

  n = {
    ["<C-h>"] = { ":NvimTreeFindFile<CR>"},
    [",s"] = { "<Plug>(easymotion-s)"},
    ["<C-b>n"] = { ":bNext<CR>"},
    ["<C-b>p"] = { ":bprevious<CR>"},
    [",ca"] = { "<cmd>lua vim.lsp.buf.code_action()<CR>"},
    [",cr"] = { "<cmd>lua vim.lsp.buf.rename()<CR>"},
    [",ci"] = { "<cmd>lua vim.lsp.buf.type_definition()<CR>"},
    [",cf"] = { "<cmd>lua vim.lsp.buf.format()<CR>"},
    [",co"] = { ":SymbolsOutline<CR>"},
  },

  v = {
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<C-p>"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
    [",ag"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
    ["<leader>b"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
    ["<leader>tk"] = { "<cmd> Telescope keymaps <CR>", "show keys" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "nvchad themes" },
  },
}

return M
