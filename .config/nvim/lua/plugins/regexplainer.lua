return {
  "bennypowers/nvim-regexplainer",
  config = function()
    require("regexplainer").setup({
      -- automatically show the explainer when the cursor enters a regexp
      auto = true,

      -- filetypes (i.e. extensions) in which to run the autocommand
      filetypes = {
        "html",
        "js",
        "cjs",
        "mjs",
        "ts",
        "jsx",
        "tsx",
        "cjsx",
        "mjsx",
        "sh",
      },
    })
  end,
  requires = {
    "nvim-treesitter/nvim-treesitter",
    "MunifTanjim/nui.nvim",
  },
}
