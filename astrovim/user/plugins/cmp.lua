return {
  { -- override nvim-cmp plugin
    "hrsh7th/nvim-cmp",
    -- override the options table that is used in the `require("cmp").setup()` call
    opts = function(_, opts)
      -- opts parameter is the default options table
      -- the function is lazy loaded so cmp is able to be required
      local cmp = require "cmp"
      -- modify the sources part of the options table
      opts.sources = cmp.config.sources {
        { name = "nvim_lsp", priority = 1000, keyword_length = 3 },
        { name = "nvim_lsp_signature_help", priority = 800, keyword_length = 3 },
        { name = 'vsnip', pirority = 800, keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
        { name = "luasnip", priority = 750, keyword_length = 2 },
        { name = "buffer", priority = 500, keyword_length = 2 },
        { name = "path", priority = 250 },
      }

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }

      opts.formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
          local menu_icon ={
            nvim_lsp = 'λ',
            vsnip = '⋗',
            buffer = 'Ω',
            path = '🖫',
          }
          item.menu = menu_icon[entry.source.name]
          return item
        end
      }

      -- return the new table to be used
      return opts
    end
  },
  { 'hrsh7th/cmp-nvim-lsp-signature-help' }
}
