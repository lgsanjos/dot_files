-- Telescope

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fa', builtin.git_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

require("telescope").setup({
  extensions = {
    aerial = {
      -- Set the width of the first two columns (the second
      -- is relevant only when show_columns is set to 'both')
      col1_width = 4,
      col2_width = 30,
      -- How to format the symbols
      format_symbol = function(symbol_path, filetype)
        if filetype == "json" or filetype == "yaml" then
          return table.concat(symbol_path, ".")
        else
          return symbol_path[#symbol_path]
        end
      end,
      -- Available modes: symbols, lines, both
      show_columns = "both",
    },
  },
})

-- LSP

-- local lsp_zero = require('lsp-zero')

-- local lsp_attach = function(client, bufnr)
-- 	local opts = { buffer = bufnr }
-- 	vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
-- 	vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
-- 	vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
-- 	vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
-- 	vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
-- 	vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
-- 	vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
-- 	vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
-- 	vim.keymap.set('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
-- 	vim.keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
-- end

-- lsp_zero.extend_lspconfig({
-- 	sign_text = true,
-- 	lsp_attach = lsp_attach,
-- 	float_border = 'rounded',
-- 	capabilities = require('cmp_nvim_lsp').default_capabilities()
-- })


-- require('lspconfig').ts_lsp.setup({})
--
--
-- require('mason').setup({})
-- require('mason-lspconfig').setup({
-- 	handlers = {
-- 		function(server_name)
-- 			require('lspconfig')[server_name].setup({})
-- 		end,
-- 	}
-- })
--
-- local cmp = require('cmp')
-- local cmp_action = lsp_zero.cmp_action()
--
-- -- this is the function that loads the extra snippets
-- -- from rafamadriz/friendly-snippets
-- require('luasnip.loaders.from_vscode').lazy_load()
--
-- cmp.setup({
-- 	sources = {
--     { name = "nvim_lsp_signature_help" },
-- 		{ name = 'nvim_lsp', keyword_length = 1, max_item_count = 10, group_index = 2 },
-- 		{ name = 'luasnip', keyword_length = 2, group_index = 2 },
-- 		{ name = 'buffer', keyword_length = 4 },
-- 		{ name = 'path' },
-- 	},
-- 	window = {
-- 		completion = cmp.config.window.bordered(),
-- 		documentation = cmp.config.window.bordered(),
-- 	},
-- 	snippet = {
-- 		expand = function(args)
-- 			require('luasnip').lsp_expand(args.body)
-- 		end,
-- 	},
-- 	mapping = cmp.mapping.preset.insert({
-- 		-- confirm completion item
-- 		['<Enter>'] = cmp.mapping.confirm({ select = true }),
--
-- 		-- trigger completion menu
-- 		['<C-Space>'] = cmp.mapping.complete(),
--
-- 		-- scroll up and down the documentation window
-- 		['<C-u>'] = cmp.mapping.scroll_docs(-4),
-- 		['<C-d>'] = cmp.mapping.scroll_docs(4),
--
-- 		-- navigate between snippet placeholders
-- 		['<C-f>'] = cmp_action.luasnip_jump_forward(),
-- 		['<C-b>'] = cmp_action.luasnip_jump_backward(),
-- 	}),
-- 	-- note: if you are going to use lsp-kind (another plugin)
-- 	-- replace the line below with the function from lsp-kind
-- 	formatting = lsp_zero.cmp_format({ details = true }),
-- })
--
