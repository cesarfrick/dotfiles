return {
  "dart-lang/dart-vim-plugin",
  event = "VeryLazy",
  ft = "dart",
  enabled = true,
  config = function()
    vim.g.dart_style_guide = 2
    vim.g.dart_format_on_save = 1
  end,
}
