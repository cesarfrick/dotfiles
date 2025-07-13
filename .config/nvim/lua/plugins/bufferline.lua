return {
	"akinsho/bufferline.nvim",
	-- enabled = false,
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",
	opts = {
		options = {
			diagnostics = { "nvim_lsp" },
			offsets = {
				{
					filetype = "snacks_picker_list",
					text = "File Explorer",
					separator = true,
					highlight = "Directory",
					text_align = "center",
				},
			},
		},
	},
}
