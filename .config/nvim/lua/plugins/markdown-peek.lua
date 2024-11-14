return {
  "toppair/peek.nvim",
  event = { "VeryLazy" },
  version = "*",
  build = "deno task --quiet build:fast",
  name = "markdown-peek",
  -- enabled = false,
  config = function()
    require("peek").setup()
    vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
    vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
  end,
}
