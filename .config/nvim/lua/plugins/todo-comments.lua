return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local map = vim.keymap.set
		local todos = require("todo-comments")

		todos.setup({})

		map("n", "<C-n>", function()
			todos.jump_next()
		end, { desc = "Next Todo" })
		map("n", "<C-p>Tp", function()
			todos.jump_prev()
		end, { desc = "Prev Todo" })
	end,
}
