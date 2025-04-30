-- Loads the terminal inside of Neovim

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  enabled = false,
  event = "VeryLazy",
  config = function()
    local map = vim.keymap.set
    require("toggleterm").setup({
      direction = "horizontal",
      open_mapping = [[<C-_>]],
      start_in_insert = true,
      auto_scroll = true,
    })

    map(
      "n",
      "<leader>wh",
      '<cmd>ToggleTerm direction="horizontal" size=20<CR>',
      { desc = "Toggle horizontal terminal" }
    )
    -- map(
    -- 	"n",
    -- 	"<leader>wv",
    -- 	'<cmd>ToggleTerm direction="vertical" size=20<CR>',
    -- 	{ desc = "Toggle vertical terminal" }
    -- )
    map("n", "<leader>wf", '<cmd>ToggleTerm direction="float"<CR>', { desc = "Toggle floating terminal" })
  end,
}
