return {
  "SuperBo/fugit2.nvim",
  opts = {
    width = 70,
    external_diffview = true, -- tell fugit2 to use diffview.nvim instead of builtin implementation.
    libgit2_path = "/usr/local/opt/libgit2/lib/libgit2.dylib",
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    {
      "chrisgrieser/nvim-tinygit", -- optional: for Github PR view
      dependencies = { "stevearc/dressing.nvim" },
    },
  },
  cmd = { "Fugit2", "Fugit2Blame", "Fugit2Diff", "Fugit2Graph" },
  keys = {
    { "<leader>gF", mode = "n", "<cmd>Fugit2<cr>", desc = "Fugit2" },
  },
}
