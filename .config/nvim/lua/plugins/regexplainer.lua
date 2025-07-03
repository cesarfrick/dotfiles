return {
	"bennypowers/nvim-regexplainer",
	config = function()
		local map = vim.keymap.set

		require("regexplainer").setup({
			-- automatically show the explainer when the cursor enters a regexp
			auto = true,

			-- filetypes (i.e. extensions) in which to run the autocommand
			filetypes = {
				"html",
				"js",
				"cjs",
				"mjs",
				"ts",
				"jsx",
				"tsx",
				"cjsx",
				"mjsx",
				"sh",
			},
		})

		map("n", "cr", "<cmd>RegexExplainerToggle<CR>", { desc = "Toggle RegexExplainer" })
	end,
	requires = {
		"nvim-treesitter/nvim-treesitter",
		"MunifTanjim/nui.nvim",
	},
}
