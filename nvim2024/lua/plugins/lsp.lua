-- return {
--   {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},
--   {'williamboman/mason.nvim'},
--   {'williamboman/mason-lspconfig.nvim'},
--   {'neovim/nvim-lspconfig'},
--   {'L3MON4D3/LuaSnip'},
--   {'hrsh7th/nvim-cmp'},
--   {'hrsh7th/cmp-nvim-lsp-signature-help'},
--   {'hrsh7th/cmp-nvim-lsp'},
--   {'hrsh7th/cmp-buffer'},
--   {'hrsh7th/cmp-path'},
--   {'saadparwaiz1/cmp_luasnip'},
--   {'rafamadriz/friendly-snippets'},
-- };



return {
  { "stevearc/conform.nvim" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/nvim-cmp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "j-hui/fidget.nvim" },

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "stevearc/conform.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "j-hui/fidget.nvim",
    },

    config = function()
      require("conform").setup({
        formatters_by_ft = {
        }
      })
      local cmp = require('cmp')
      local cmp_lsp = require("cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        cmp_lsp.default_capabilities())

      require("fidget").setup({})
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "gopls",
          "vtsls",
        },
        handlers = {
          function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {
              capabilities = capabilities
            }
          end,

          zls = function()
            local lspconfig = require("lspconfig")
            lspconfig.zls.setup({
              root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
              settings = {
                zls = {
                  enable_inlay_hints = true,
                  enable_snippets = true,
                  warn_style = true,
                },
              },
            })
            vim.g.zig_fmt_parse_errors = 0
            vim.g.zig_fmt_autosave = 0

          end,
          ["lua_ls"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup {
              capabilities = capabilities,
              settings = {
                Lua = {
                  runtime = { version = "Lua 5.1" },
                  diagnostics = {
                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                  }
                }
              }
            }
          end,
        }
      })

      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
          ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
          ['<cr>'] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        sources = cmp.config.sources({
          -- { name = "copilot", group_index = 2 },
          -- { name = 'nvim_lsp' },
          -- { name = 'luasnip' }, -- For luasnip users.
          {
            name = "luasnip",
            priority = 150,
            group_index = 1,
            option = { show_autosnippets = true, use_show_condition = false },
          },
          {
            name = "nvim_lua",
            entry_filter = function()
              if vim.bo.filetype ~= "lua" then
                return false
              end
              return true
            end,
            priority = 150,
            group_index = 1,
          },
          {
            name = "lazydev",
            group_index = 0,
            entry_filter = function()
              if vim.bo.filetype ~= "lua" then
                return false
              end
              return true
            end,
            priority = 100,
          },
          {
            name = "nvim_lsp",
            priority = 100,
            group_index = 1,
          },
          { name = "nvim_lsp_signature_help", priority = 100, group_index = 1 },
          {
            name = "treesitter",
            max_item_count = 5,
            priority = 90,
            group_index = 5,
            entry_filter = function(entry, vim_item)
              if entry.kind == 15 then
                local cursor_pos = vim.api.nvim_win_get_cursor(0)
                local line = vim.api.nvim_get_current_line()
                local next_char = line:sub(cursor_pos[2] + 1, cursor_pos[2] + 1)
                if next_char == '"' or next_char == "'" then
                  vim_item.abbr = vim_item.abbr:sub(1, -2)
                end
              end
              return vim_item
            end,
          },
          {
            name = "rg",
            keyword_length = 5,
            max_item_count = 5,
            option = {
              additional_arguments = "--smart-case --hidden",
            },
            priority = 80,
            group_index = 3,
          },
          {
            name = "buffer",
            max_item_count = 5,
            keyword_length = 2,
            priority = 50,
            entry_filter = function(entry)
              return not entry.exact
            end,
            option = {
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end,
            },
            group_index = 4,
          },
          {
            name = "git",
            entry_filter = function()
              if vim.bo.filetype ~= "gitcommit" then
                return false
              end
              return true
            end,
            priority = 40,
            group_index = 5,
          },
          { name = "dap", priority = 40, group_index = 6 },
          { name = "async_path", priority = 30, group_index = 5 },
          { name = "calc", priority = 10, group_index = 9 },
          {
            name = "conventionalcommits",
            priority = 10,
            group_index = 9,
            max_item_count = 5,
            entry_filter = function()
              if vim.bo.filetype ~= "gitcommit" then
                return false
              end
              return true
            end,
          },
          {
            name = "fish",
            priority = 10,
            group_index = 9,
            entry_filter = function()
              if vim.bo.filetype ~= "gitcommit" then
                return false
              end
              return true
            end,
          },
          {
            name = "emoji",
            priority = 10,
            group_index = 9,
            entry_filter = function()
              if vim.bo.filetype ~= "gitcommit" then
                return false
              end
              return true
            end,
          },
        }, {
            { name = 'buffer' },
          }
        ),
        experimental = {
          -- only show ghost text when we show ai completions
          ghost_text = vim.g.ai_cmp and {
            hl_group = "CmpGhostText",
          } or false,
        },
      })

      vim.diagnostic.config({
        -- update_in_insert = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end
  }
}

