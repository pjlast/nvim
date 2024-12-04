vim.o.termguicolors = true
vim.cmd([[colorscheme retrobox]])
vim.o.number = true
vim.o.relativenumber = true
vim.o.list = true
vim.o.listchars = "tab:│ "

vim.keymap.set("n", "]d", function()
	vim.diagnostic.goto_next()
	vim.diagnostic.open_float()
end)

vim.keymap.set("n", "[d", function()
	vim.diagnostic.goto_prev()
	vim.diagnostic.open_float()
end)

require("config.lazy")
