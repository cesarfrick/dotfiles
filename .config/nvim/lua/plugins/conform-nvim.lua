return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  enabled = true,
  config = function()
    local conform = require("conform")
    local map = vim.keymap.set

    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        html = { "htmlbeautifier", "prettierd" },
        css = { "stylelint", "prettierd", "prettier", stop_after_first = true },
        json = { "fixjson", "prettierd", "prettier", stop_after_first = true },
        markdown = { "mdformat", "prettierd", "prettier", stop_after_first = true },
        bash = { "beautysh" },
        python = {
          "ruff",
          -- "pyright",
          "pylyzer",
          "pylint",
          "docformatter",
          "black",
          "yapf",
          "isort",
          -- stop_after_first = true,
        },
        jinja = { "djlint" },
        yaml = { "yamlfmt", "yamlfix", "prettierd", "prettier", stop_after_first = true },
        go = { "goimports", "gofumpt" },
        ["*"] = { "codespell" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
        async = false,
      },
    })

    map({ "n", "v" }, "<leader>cF", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
