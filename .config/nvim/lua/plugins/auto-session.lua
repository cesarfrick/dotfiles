return {
	"rmagatti/auto-session",
	-- enabled = false,
	config = function()
		local map = vim.keymap.set

		require("auto-session").setup({
			auto_restore = false,
			git_auto_restore_on_branch_change = true,
			git_use_branch_name = true,
			log_level = "error",
			session_lens = {
				picker_opts = {
					preset = "dropdown",
					preview = false,
					layout = {
						width = 0.4,
						height = 0.4,
					},
				},
			},
			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		})

		map("n", "<leader>sS", "<cmd>SessionSearch<cr>", { desc = "Search Session" })
		map("n", "<leader>ss", "<cmd>SessionSave<cr>", { desc = "Save Session" })
		map("n", "<leader>sr", "<cmd>SessionRestore<cr>", { desc = "Restore Session" })
		map("n", "<leader>sd", "<cmd>SessionDelete<cr>", { desc = "Delete Session" })
	end,
}
