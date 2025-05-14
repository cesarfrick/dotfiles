return {
  "rshkarin/mason-nvim-lint",
  event = "VeryLazy",
  config = function()
    require("mason-nvim-lint").setup({
      ensure_installed = {
        "codespell",
        "djlint",
        "flake8",
        "htmlhint",
        "markdownlint",
        "jsonlint",
        "luacheck",
        -- "markdownlint-cli2",
        "shellcheck",
        "shellharden",
        -- "staticcheck",
        "stylelint",
        "yamllint",
        "eslint_d",
      },
    })
  end,
}
