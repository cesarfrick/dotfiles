return {
  "rmagatti/auto-session",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    local map = vim.keymap.set

    require("auto-session").setup({
      auto_restore = false,
      log_level = "error",
      suppressed_dirs = { "~/", "~/Downloads", "/", "~/Documents" },
      allowed_dirs = { "~/prj", "~/learn" },
    })

    map("n", "<leader>sS", "<cmd>SessionSearch<cr>", { desc = "Search Session" })
    map("n", "<leader>ss", "<cmd>SessionSave<cr>", { desc = "Save Session" })
    map("n", "<leader>sr", "<cmd>SessionRestore<cr>", { desc = "Restore Session" })
    map("n", "<leader>sd", "<cmd>SessionDelete<cr>", { desc = "Delete Session" })
  end,
}
