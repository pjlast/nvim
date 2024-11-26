return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "LSP definitions" })
		vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "LSP references" })
		vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "LSP implementations" })
		vim.keymap.set("n", "gt", builtin.lsp_type_definitions, { desc = "LSP type definitions" })
		vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "LSP diagnostics" })
	end,
}
