-- Let's you load your projects from a Telescope finder

return {
  "ahmedkhalf/project.nvim",
  enabled = false,
  config = function()
    local map = vim.keymap.set

    require("project_nvim").setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    })

    -- require("telescope").load_extension("projects")

    map("n", "<leader>p", ":Telescope projects<CR>", { desc = "Projects" })
  end,
}
