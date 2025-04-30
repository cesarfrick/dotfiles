return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		{
			"nvim-treesitter/nvim-treesitter-context",
			opts = {
				enable = true,
				mode = "topline",
				line_numbers = true,
			},
		},
	},
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")

		vim.api.nvim_create_autocmd("Filetype", {
			pattern = { "markdown" },
			callback = function()
				require("treesitter-context").disable()
			end,
		})

		config.setup({
			ensure_installed = {
				"astro",
				"bash",
				"go",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"regex",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
			auto_install = true,
			auto_tag = { enable = true },
			ignore_install = {},
			modules = {},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
				},
			},
		})
	end,
}
