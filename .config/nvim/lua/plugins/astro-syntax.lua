return {
  "wuelnerdotexe/vim-astro",
  event = { "BufReadPre", "BufNewFile" },
  ft = "astro",
  enabled = true,
  config = function()
    vim.g.astro_typescript = "enable"
    vim.g.astro_markdown = "enable"
  end,
}
