return {
  "tris203/precognition.nvim",
  event = "VeryLazy",
  config = function()
    local map = vim.keymap.set
    local precognition = require("precognition")
    precognition.setup({})

    map({ "n", "v" }, "<C-i>", function()
      if precognition.toggle() then
        vim.notify("Precognition on")
      else
        vim.notify("Precognition off")
      end
    end)
  end,
}
