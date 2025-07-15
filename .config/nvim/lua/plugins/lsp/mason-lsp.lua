return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "astro",
        "bashls",
        "basedpyright",
        "cssls",
        "css_variables",
        "cssmodules_ls",
        "emmet_language_server",
        "eslint",
        "gopls",
        "html",
        "lua_ls",
        "stylelint_lsp",
        "ts_ls",
        "yamlls",
      },
    })
  end,
}
