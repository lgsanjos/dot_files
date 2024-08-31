-- Basic settings
vim.o.number = true          -- Enable line numbers
vim.o.relativenumber = false -- Enable relative line numbers
vim.o.tabstop = 2            -- Number of spaces a tab represents
vim.o.shiftwidth = 2         -- Number of spaces for each indentation
vim.o.expandtab = true       -- Convert tabs to spaces
vim.o.smartindent = true     -- Automatically indent new lines
vim.o.wrap = false           -- Disable line wrapping
vim.o.cursorline = true      -- Highlight the current line
vim.o.cursorcolumn = true
vim.o.termguicolors = true   -- Enable 24-bit RGB colors
vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }
vim.o.foldenable = true
vim.o.ai = true
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.showmatch = true
vim.o.autoindent = true
vim.o.showcmd = true
vim.o.autoread = true

vim.opt.backup = false
vim.opt.swapfile = false

-- Syntax highlighting and filetype plugins
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
