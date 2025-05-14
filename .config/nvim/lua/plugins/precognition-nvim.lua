return {
  "tris203/precognition.nvim",
  config = function()
    local precognition = require("precognition")
    local map = vim.keymap.set

    precognition.setup({})

    map("n", "<leader>wp", precognition.toggle, { desc = "Toggle Precognition" })
  end,
}
