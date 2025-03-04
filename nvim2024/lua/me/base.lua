-- Basic settings
vim.o.number = true          -- Enable line numbers
vim.o.relativenumber = false -- Enable relative line numbers
vim.o.tabstop = 2            -- Number of spaces a tab represents
vim.o.shiftwidth = 2         -- Number of spaces for each indentation
vim.o.expandtab = true       -- Convert tabs to spaces
vim.o.smartindent = true     -- Automatically indent new lines
vim.o.wrap = false           -- Disable line wrapping
vim.o.cursorline = true      -- Highlight the current line
vim.o.cursorcolumn = false
vim.o.termguicolors = true   -- Enable 24-bit RGB colors
vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }
vim.o.ai = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.showmatch = true
vim.o.autoindent = true
vim.o.showcmd = true
vim.o.autoread = true

vim.opt.backup = false
vim.opt.swapfile = false

vim.opt.foldenable = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "1"
vim.opt.fillchars = { fold = " " }
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
-- vim.opt.foldlevelstart

-- Syntax highlighting and filetype plugins
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

vim.api.nvim_exec(
  [[
  nnoremap <silent> <cr> :noh<cr><cr>
  set switchbuf=useopen,usetab
  set laststatus=3
  ]], false
)
