return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")

    wk.add({
      { "<leader>T", group = "+test" },
      { "<leader>b", group = "+buffers" },
      { "<leader>c", group = "+code" },
      { "<leader>d", group = "+debug" },
      { "<leader>f", group = "+files/find" },
      { "<leader>g", group = "+git" },
      { "<leader>p", group = "+project" },
      { "<leader>s", group = "+session" },
      { "<leader>t", group = "+tabs" },
      { "<leader>u", group = "+update" },
      { "<leader>v", group = "+Python Environment" },
      { "<leader>w", group = "+window" },
      { "<leader>x", group = "+Trouble" },
    })
  end,
}
