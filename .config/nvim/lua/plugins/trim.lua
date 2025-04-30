return {
  "cappyzawa/trim.nvim",
  name = "trim-nvim",
  config = function()
    require("trim").setup({
      trim_last_line = false,
      ft_blocklist = {
        "Telescope",
        "TelescopePrompt",
        "TelescopeResults",
        "checkhealth",
        "dap-repl",
        "dapui",
        "fzf",
        "help",
        "lazy",
        "lspinfo",
        "lsp-installer",
        "lsp-installer-ui",
        "markdown",
        "mason",
        "neo-tree",
        "neo-tree-popup",
        "null-ls-info",
        "snacks_dashboard",
        "toggleterm",
      },
    })
  end,
}
