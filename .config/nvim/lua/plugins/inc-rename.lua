return {
  "smjonas/inc-rename.nvim",
  cmd = "IncRename",
  enabled = false,
  keys = {
    {
      "<leader>cn",
      function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end,
      desc = "Incremental rename",
      mode = "n",
      -- noremap = true,
      expr = true,
    },
  },
  config = true,
  opts = {
    input_buffer_type = "dressing",
  },
}
