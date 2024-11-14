return {
  "smjonas/inc-rename.nvim",
  cmd = "IncRename",
  -- enabled = false,
  keys = {
    {
      "<leader>cr",
      function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end,
      desc = "Incremental rename",
      mode = { "x", "n" },
      noremap = true,
      expr = true,
    },
  },
  config = true,
  opts = {
    -- input_buffer_type = "dressing",
    input_buffer_type = "noice",
  },
}
