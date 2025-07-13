return {
	"ThePrimeagen/refactoring.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		local map = vim.keymap.set

		require("refactoring").setup({
			show_success_message = true,
			prompt_func_return_type = {
				go = true,
			},
			prompt_func_param_type = {
				go = true,
			},
		})

		map("x", "<leader>re", "<cmd>Refactor extract<CR>", { desc = "Extract" })
		map("x", "<leader>rf", "<cmd>Refactor extract_to_file<CR>", { desc = "Extract to file" })
		map("x", "<leader>rv", "<cmd>Refactor extract_var<CR>", { desc = "Extract variable" })
		map({ "n", "x" }, "<leader>ri", "<cmd>Refactor inline_var<CR>", { desc = "Inline variable" })
		map("n", "<leader>rI", "<cmd>Refactor inline_func<CR>", { desc = "Inline function" })
		map("n", "<leader>rb", "<cmd>Refactor extract_block_to_file<CR>", { desc = "Extract block to file" })
	end,
}
