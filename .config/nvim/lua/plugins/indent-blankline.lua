return {
  "lukas-reineke/indent-blankline.nvim",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  opts = {
    indent = {
      char = "│",
      tab_char = "│",
    },
    -- scope = { show_start = false, show_end = false },
    scope = { enabled = false },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
  },
  main = "ibl",
}
