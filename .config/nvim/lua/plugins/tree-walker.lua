return {
  "aaronik/treewalker.nvim",
  enabled = false,
  config = function()
    local map = vim.keymap.set

    map("n", "<C-j>", "<cmd>Treewalker Down<CR>", { noremap = true })
    map("n", "<C-k>", "<cmd>Treewalker Up<CR>", { noremap = true })
    map("n", "<C-h>", "<cmd>Treewalker Left<CR>", { noremap = true })
    map("n", "<C-l>", "<cmd>Treewalker Right<CR>", { noremap = true })
  end,
  opts = {
    highlight = true, -- default is false
  },
}
