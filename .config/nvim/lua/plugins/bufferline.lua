return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    options = {
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          separator = true,
          highlight = "Directory",
          text_align = "center",
        },
      },
    },
  },
}
