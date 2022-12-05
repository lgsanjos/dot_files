local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- b.formatting.prettier,
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } },

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- builtin
  b.code_actions.eslint,
  b.code_actions.refactoring,
  b.code_actions.xo,
  b.completion.luasnip,
  b.diagnostics.tsc,

  -- hover
  b.hover.dictionary,
}

null_ls.setup {
  debounc = 150,
  debug = true,
  sources = sources,
}
