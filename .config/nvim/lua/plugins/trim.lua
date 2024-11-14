return {
  "cappyzawa/trim.nvim",
  name = "trim-nvim",
  config = function()
    require("trim").setup({
      highlight = true,
      trim_last_line = false,
      ft_blocklist = {
        "alpha",
        "Telescope",
        "TelescopePrompt",
        "lazy",
        "mason",
        "toggleterm",
        "neo-tree",
        "help",
        "TelescopeResults",
        "neo-tree-popup",
        "markdown",
        "fzf",
        "checkhealth",
        "lspinfo",
        "lsp-installer",
        "lsp-installer-ui",
        "null-ls-info",
        "dap-repl",
        "dapui",
      },
    })
  end,
}
