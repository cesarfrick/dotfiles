return {
  "anuvyklack/windows.nvim",
  -- enabled = false,
  dependencies = {
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim",
  },
  config = function()
    vim.o.winwidth = 8
    vim.o.winminwidth = 5
    vim.o.equalalways = true
    require("windows").setup()
  end,
}
