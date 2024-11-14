return {
	"ThePrimeagen/refactoring.nvim",
	lazy = true,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("refactoring").setup({
			show_success_message = true,
			prompt_func_return_type = {
				go = true,
			},
			prompt_func_param_type = {
				go = true,
			},
		})
	end,
}
