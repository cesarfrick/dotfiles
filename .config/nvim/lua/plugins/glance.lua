return {
	"dnlhc/glance.nvim",
	config = function()
		require("glance").setup({
			-- your configuration
		})

		local opts = { noremap = true, silent = true }
		local map = vim.keymap.set

		map("n", "gD", "<cmd>Glance definitions<CR>", opts)
		map("n", "gY", "<cmd>Glance type_definitions<CR>", opts)
		map("n", "gr", "<cmd>Glance references<CR>", opts)
		map("n", "gI", "<cmd>Glance implementations<CR>", opts)
	end,
}
