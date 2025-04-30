return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		"mfussenegger/nvim-dap-python", --optional
		{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
	},
	lazy = false,
	branch = "regexp", -- This is the regexp branch, use this for the new version
	config = function()
		local map = vim.keymap.set
		require("venv-selector").setup({})

		map("n", "<leader>v", "<cmd>VenvSelect<cr>", { desc = "Select Python Virtual Environment" })
	end,
}
