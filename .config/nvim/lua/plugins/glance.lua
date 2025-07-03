return {
	"dnlhc/glance.nvim",
	-- cmd = "Glance",
	config = function()
		require("glance").setup()

		local map = vim.keymap.set
		map("n", "gD", "<cmd>Glance definitions<cr>", { desc = "Glance Definitions" })
		map("n", "gY", "<cmd>Glance type_definitions<cr>", { desc = "Glance Type Definitions" })
		map("n", "gR", "<cmd>Glance references<cr>", { desc = "Glance References" })
		map("n", "gM", "<cmd>Glance implementations<cr>", { desc = "Glance Implementations" })
	end,
}
