-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "gruvchad",
}

M.mappings = require "custom.mappings"

local userPlugins = require "custom.plugins"
M.plugins = {
   override = {
      ["nvim-treesitter/nvim-treesitter"] = {
        ensure_installed = {
          "html",
          "scss",
          "css",
          "javascript",
          "graphql",
          "json",
          "typescript",
          "ruby",
          "markdown"
       },
     }
   },
   user = userPlugins
}

return M
