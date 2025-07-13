return {
	"nvim-neotest/neotest-jest",
	dependencies = {
		"nvim-neotest/neotest",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-jest")({
					jestCommand = "npm test --",
					env = { CI = true },
					cwd = function()
						return vim.fn.getcwd()
					end,
				}),
			},
		})
	end,
}
