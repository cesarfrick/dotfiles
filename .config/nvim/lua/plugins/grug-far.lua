return {
  "MagicDuck/grug-far.nvim",
  config = function()
    require("grug-far").setup({})
    local map = vim.keymap.set

    map("n", "<leader>bs", "<cmd>GrugFarWithin<CR>", { desc = "Search/Replace" })
  end,
}
