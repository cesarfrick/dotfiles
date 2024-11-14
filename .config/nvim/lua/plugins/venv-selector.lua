return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-python", --optional
    { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
  },
  lazy = true,
  ft = "python",
  branch = "regexp", -- This is the regexp branch, use this for the new version
  config = function()
    local map = vim.keymap.set

    require("venv-selector").setup()

    map(
      "n",
      "<leader>vs",
      "<cmd>VenvSelect<CR>",
      { noremap = true, silent = true, desc = "Select Python Virtual env" }
    )
    map(
      "n",
      "<leader>vc",
      "<cmd>VenvSelectChached<CR>",
      { noremap = true, silent = true, desc = "Retrieve Virtual env from cache" }
    )
  end,
}
