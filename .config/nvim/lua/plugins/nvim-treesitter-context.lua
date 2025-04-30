return {
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufReadPre",
  opts = { mode = "cursor", max_lines = 3 },
  config = function()
    local map = vim.keymap.set
    local state = true

    map("n", "<leader>cT", function()
      local tsc = require("treesitter-context")
      local noice = require("noice")

      tsc.toggle()
      state = not state

      if state then
        noice.notify("Treesitter Context Enabled", "info", { title = "Option" })
      else
        noice.notify("Treesitter Context Disabled", "info", { title = "Option" })
      end
    end, { desc = "Toggle Treesitter Context" })
  end,
}
