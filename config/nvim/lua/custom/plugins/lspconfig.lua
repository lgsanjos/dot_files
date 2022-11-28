local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "cssls",
  "emmet_ls",
  'tsserver',
  'purescriptls',
  'html',
  'terraformls',
  'graphql',
  'hls',
  'jsonls',
  'sqlls',
  'sorbet',
  'solargraph',
  'eslint',
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }
end
