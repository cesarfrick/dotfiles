return {
  "mfussenegger/nvim-dap-python",
  -- enabled = false,
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  config = function()
    require("dap-python").setup("python")
  end,
}
