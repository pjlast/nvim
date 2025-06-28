return {
	{
		'folke/tokyonight.nvim',
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		'folke/snacks.nvim',
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			explorer = { enabled = true },
			indent = { enabled = true },
			input = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			statuscolumn = { enabled = true },
		},
		keys = {
			{ "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
			{ "<leader>ff", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
			{ "<leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
			{ "<leader>fn", function() Snacks.picker.notifications() end, desc = "Notifications" },
			{ "gd", function() Snacks.picker.lsp_definitions() end, desc = "LSP Definitions" },
			{ "gr", function() Snacks.picker.lsp_references() end, desc = "LSP References" },
			{ "gt", function() Snacks.picker.lsp_type_definitions() end, desc = "LSP Type Definitions" },
			{ "gi", function() Snacks.picker.lsp_implementations() end, desc = "LSP Implementations" },
		},
	},
	{
		'j-hui/fidget.nvim',
		opts = {},
	},
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		config = function()
			local configs = require('nvim-treesitter.configs')

			configs.setup({
				ignore_install = {},
				modules = {},
				auto_install = false,
				ensure_installed = { 'c', 'cpp', 'css', 'html', 'json', 'jsonc', 'lua', 'nix', 'vimdoc', 'go' },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		'stevearc/oil.nvim',
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			view_options = {
				show_hidden = true
			}
		},
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},
	{
		'saghen/blink.cmp',
		version = '1.*',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = 'default' },
			appearance = {
				nerd_font_variant = 'mono'
			},
			completion = { documentation = { auto_show = true } },
			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
			},
			fuzzy = { implementation = 'prefer_rust_with_warning' }
		},
		opts_extend = { 'sources.default' }
	},
}
