return {
  "Exafunction/codeium.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  cmd = "Codeium",
  build = ":Codeium Auth",
  -- lazy = true,
  event = { "BufEnter", "BufReadPre" },
  config = function()
    local map = vim.keymap.set

    require("codeium").setup({
      enable_chat = true,
    })
    -- Change '<C-g>' here to any keycode you like.
    map("i", "<C-g>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true, silent = true, desc = "Accept Codeium Suggestion" })
    map("i", "<c-;>", function()
      return vim.fn["codeium#CycleCompletions"](1)
    end, { expr = true, silent = true, desc = "Cycle Codeium Completions" })
    map("i", "<c-,>", function()
      return vim.fn["codeium#CycleCompletions"](-1)
    end, { expr = true, silent = true, desc = "Cycle Codeium Completions" })
    map("i", "<c-x>", function()
      return vim.fn["codeium#Clear"]()
    end, { expr = true, silent = true, desc = "Clear Codeium Suggestion" })
  end,
}
