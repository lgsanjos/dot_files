-- LuaSnip comes from lazyvim.plugins.extras.coding.luasnip (see lua/config/lazy.lua),
-- which wires it into nvim-cmp and friendly-snippets. This just adds the
-- extras this config relied on.
return {
  {
    "L3MON4D3/LuaSnip",
    opts = function(_, opts)
      require("luasnip").filetype_extend("javascript", { "jsdoc" })
      return opts
    end,
    -- stylua: ignore
    keys = {
      { "<C-s>e", function() require("luasnip").expand() end, mode = "i", silent = true, desc = "LuaSnip expand" },
      { "<C-s>;", function() require("luasnip").jump(1) end, mode = { "i", "s" }, silent = true, desc = "LuaSnip jump next" },
      { "<C-s>,", function() require("luasnip").jump(-1) end, mode = { "i", "s" }, silent = true, desc = "LuaSnip jump prev" },
      { "<C-E>", function()
          local ls = require("luasnip")
          if ls.choice_active() then ls.change_choice(1) end
        end, mode = { "i", "s" }, silent = true, desc = "LuaSnip next choice" },
    },
  },
}
