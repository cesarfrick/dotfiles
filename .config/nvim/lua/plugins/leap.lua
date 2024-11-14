return {
  "ggandor/leap.nvim",
  dependencies = { "tpope/vim-repeat" },
  event = "BufReadPost",
  config = function()
    local map = vim.keymap.set

    map({ "n", "x", "o" }, "f", "<Plug>(leap-forward-to)", { silent = true })
    map({ "n", "x", "o" }, "F", "<Plug>(leap-backward-to)", { silent = true })
    map({ "n", "x", "o" }, "gs", "<Plug>(leap-to-window)", { silent = true })
    map({ "n", "x", "o" }, "gS", "<Plug>(leap-from-window)", { silent = true })
  end,
}
