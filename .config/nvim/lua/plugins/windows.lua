return {
	"anuvyklack/windows.nvim",
	enabled = false,
	dependencies = {
		"anuvyklack/middleclass",
		"anuvyklack/animation.nvim",
	},
	config = function()
		vim.o.winwidth = 10
		vim.o.winminwidth = 10
		vim.o.equalalways = false
		require("windows").setup({
			ignore = {
				buftype = { "quickfix" },
				filetype = { "snacks_picker", "snacks_picker_input", "snacks_picker_list" },
			},
		})
	end,
}
