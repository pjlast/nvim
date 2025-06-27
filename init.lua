require('config.lazy')

vim.cmd([[colorscheme tokyonight-night]])

vim.o.number = true
vim.o.list = true
vim.o.listchars = 'tab:│ '

vim.diagnostic.config({
	virtual_text = true,
})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function()
		vim.keymap.set('n', '<leader>fo', vim.lsp.buf.format, nil)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, nil)
		vim.keymap.set('n', '[d', function()
			vim.diagnostic.jump({count=-1, float=true})
		end, {})
		vim.keymap.set('n', ']d', function()
			vim.diagnostic.jump({count=1, float=true})
		end, {})
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, nil)
	end
})

vim.lsp.config('*', {
	root_markers = { '.git' },
})

-- Enable all LSPs in the lsp directory if the LSP's cmd
-- is executable.
for name, _ in vim.fs.dir('~/.config/nvim/lsp/') do
	local lsp_name = vim.fn.split(name, '\\.')[1]
	if vim.fn.executable(vim.lsp.config[lsp_name].cmd[1]) then
		vim.lsp.enable(lsp_name)
	else
		vim.notify('`' .. vim.lsp.config[lsp_name].cmd[1] .. '` is not executable.', vim.log.levels.ERROR)
	end
end
