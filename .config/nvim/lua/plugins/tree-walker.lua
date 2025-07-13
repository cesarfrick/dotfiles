return {
	"aaronik/treewalker.nvim",
	enabled = false,
	config = function()
		local map = vim.keymap.set

		map("n", "<C-J>", "<cmd>Treewalker Down<CR>", { noremap = true })
		map("n", "<C-K>", "<cmd>Treewalker Up<CR>", { noremap = true })
		map("n", "<C-H>", "<cmd>Treewalker Left<CR>", { noremap = true })
		map("n", "<C-L>", "<cmd>Treewalker Right<CR>", { noremap = true })
	end,
	opts = {
		highlight = true, -- default is false
	},
}
