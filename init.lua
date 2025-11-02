vim.pack.add({
	'https://github.com/folke/snacks.nvim',
	'https://github.com/ellisonleao/gruvbox.nvim',
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/j-hui/fidget.nvim',
	'https://github.com/sourcegraph/amp.nvim',
	{ src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' },
	'https://github.com/lewis6991/gitsigns.nvim',
})

require('amp').setup({ auto_start = true, log_level = 'info' })
require('nvim-treesitter').install({ 'html', 'zig' })
require('gruvbox').setup({ contrast = 'hard' })
vim.cmd([[colorscheme gruvbox]])

require('gitsigns').setup({})
---@diagnostic disable-next-line: param-type-mismatch
vim.keymap.set('n', ']c', function() require('gitsigns').nav_hunk('next') end, {})
---@diagnostic disable-next-line: param-type-mismatch
vim.keymap.set('n', '[c', function() require('gitsigns').nav_hunk('prev') end, {})

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'zig' },
	callback = function() vim.treesitter.start() end,
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = { 'html' },
	callback = function() vim.treesitter.start() end,
})

require('fidget').setup({})

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.number = true
vim.o.list = true
vim.o.listchars = 'tab:│ '
vim.o.scrolloff = 5

vim.diagnostic.config({
	virtual_text = true,
})

vim.o.pumborder = 'rounded'
vim.o.winborder = 'rounded'

vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')

vim.cmd([[set completeopt+=menuone,noselect,popup]])
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		if client:supports_method('textDocument/completion') then
			-- trigger autocompletion on EVERY keypress. May be slow!
			-- take out if it causes issues
			local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
			client.server_capabilities.completionProvider.triggerCharacters = chars

			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end

		vim.keymap.set('n', '<leader>fo', vim.lsp.buf.format, nil)
		vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, nil)
		vim.keymap.set('n', '[d', function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, {})
		vim.keymap.set('n', ']d', function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, {})
		vim.keymap.set('n', 'gd', require('snacks.picker').lsp_definitions, {})
		vim.keymap.set('n', '<leader>fg', require('snacks.picker').grep, {})

		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, nil)
	end,
})
