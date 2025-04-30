return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = function()
    local wk = require("which-key")

    wk.setup({
      preset = "helix",
      notify = true,
    })

    wk.add({
      { "<leader>T", group = "+Test" },
      { "<leader>b", group = "+Buffers" },
      { "<leader>c", group = "+Code" },
      { "<leader>d", group = "+Debug" },
      { "<leader>f", group = "+Files/+Find" },
      { "<leader>g", group = "+Git/+Navigator" },
      { "<leader>n", group = "+Neotree" },
      { "<leader>r", group = "+Refactor" },
      { "<leader>s", group = "+Session" },
      { "<leader>t", group = "+Tabs" },
      { "<leader>u", group = "+UI" },
      { "<leader>w", group = "+Window/+Workspace" },
      -- { "<leader>x", group = "+Trouble" },
    })
  end,
}
