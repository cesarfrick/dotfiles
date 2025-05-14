return {
  "mfussenegger/nvim-lint",
  lazy = true,
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      lua = { "luacheck" },
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      html = { "htmlhint" },
      css = { "stylelint" },
      json = { "jsonlint" },
      markdown = { "markdownlint", "markdownlint", stop_after_first = true },
      bash = { "shellcheck", "shellharden" },
      python = {
        "flake8",
        "pylint",
        -- stop_after_first = true,
      },
      jinja = { "djlint" },
      yaml = { "yamllint" },
      go = { "revive", "golangcilint" },
      ["*"] = { "codespell" },
    }

    -- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    --   callback = function()
    --     lint.try_lint()
    --   end,
    -- })
  end,
}
