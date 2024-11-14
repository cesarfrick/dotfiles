return {
  "ahmedkhalf/project.nvim",
  config = function()
    local map = vim.keymap.set

    require("project_nvim").setup({
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = true,
      },
    })

    require("telescope").load_extension("projects")

    map("n", "<leader>p", "<cmd>Telescope projects<CR>", { desc = "Projects" })
  end,
}
