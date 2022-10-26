local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "cssls",
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

lspconfig.purescriptls.setup {
  settings = {
    purescript = {
      addSpageSources = true
    },
  },
  flags = {
    debounce_text_changes = 150,
  },
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
