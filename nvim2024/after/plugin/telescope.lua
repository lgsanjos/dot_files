-- Finder keymaps (snacks.picker; telescope was removed in the LazyVim migration)
local function pick(name, opts)
  return function()
    require("snacks").picker[name](opts)
  end
end

vim.keymap.set("n", "<leader>ff", pick("files"), { desc = "Find files" })
vim.keymap.set("n", "<leader>fa", pick("git_files"), { desc = "Find git files" })
vim.keymap.set("n", "<leader>fg", pick("grep"), { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", pick("buffers"), { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", pick("help"), { desc = "Help tags" })
