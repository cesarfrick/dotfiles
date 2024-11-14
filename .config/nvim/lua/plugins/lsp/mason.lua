return {
	"williamboman/mason.nvim",
	dependencies = {
		"mfussenegger/nvim-lint",
		"rshkarin/mason-nvim-lint",
	},
	config = function()
		require("mason").setup()
		-- require("mason-nvim-lint").setup()
	end,
}
