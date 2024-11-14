return {
	"danymat/neogen",
	-- config = true,
	version = "*",
	config = function()
		local map = vim.keymap.set
		local neogen = require("neogen")

		neogen.setup({
			enabled = true,
		})

		map("n", "<Leader>cf", ":lua require('neogen').generate()<CR>", { desc = "Generate Annotation" })
		map(
			"n",
			"<Leader>cc",
			":lua require('neogen').generate({ type = 'class' })<CR>",
			{ desc = "Generate Class Annotation" }
		)
		map("i", "<C-l>", ":lua require('neogen').jump_next<CR>", { desc = "Jump to next annotation" })
		map("i", "<C-h>", ":lua require('neogen').jump_prev<CR>", { desc = "Jump to previous annotation" })
	end,
}
