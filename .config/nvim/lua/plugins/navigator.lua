return {
	"ray-x/navigator.lua",
	enabled = false,
	dependencies = {
		-- { "hrsh7th/nvim-cmp" },
		{ "nvim-treesitter/nvim-treesitter" },
		{ "ray-x/guihua.lua", run = "cd lua/fzy && make" },
		{
			"ray-x/go.nvim",
			event = { "CmdlineEnter" },
			ft = { "go", "gomod" },
			build = ':lua require("go.install").update_all_sync()',
		},
		-- {
		--   "ray-x/lsp_signature.nvim", -- Show function signature when you type
		--   event = "VeryLazy",
		--   config = function()
		--     require("lsp_signature").setup()
		--   end,
		-- },
	},
	config = function()
		local navigator = require("navigator")
		local map = vim.keymap.set

		navigator.setup({
			lsp_signature_help = true,
			lsp = {
				format_on_save = true,
			},
		})
	end,
}
