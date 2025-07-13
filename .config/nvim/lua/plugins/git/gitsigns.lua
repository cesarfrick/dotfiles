-- See `:help gitsigns` to understand what the configuration keys do
return { -- Adds git related signs to the gutter, as well as utilities for managing changes
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		-- signs = {
		-- 	add = { text = "+" },
		-- 	change = { text = "~" },
		-- 	delete = { text = "_" },
		-- 	topdelete = { text = "‾" },
		-- 	changedelete = { text = "~" },
		-- },
		on_attach = function()
			local gs = package.loaded.gitsigns
			local map = vim.keymap.set

			map("n", "<leader>gB", function()
				gs.blame_line({ full = true })
			end, { desc = "Blame float window" })

			map("n", "<leader>gb", gs.toggle_current_line_blame, { desc = "Toggle line blame " })
			map("n", "<leader>gd", gs.diffthis, { desc = "Diff this" })
			map("n", "<leader>gD", function()
				gs.diffthis("~")
			end, { desc = "Diff this ~" })
			map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview hunk" })
		end,
	},
}
