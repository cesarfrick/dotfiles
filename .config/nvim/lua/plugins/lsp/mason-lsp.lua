return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    local mason_lspconfig = require("mason-lspconfig")

    mason_lspconfig.setup({
      ensure_installed = {
        "ast_grep",
        "astro",
        "bashls",
        "css_variables",
        "cssls",
        "emmet_language_server",
        "eslint",
        "html",
        "jinja_lsp",
        "jsonls",
        "lua_ls",
        "marksman",
        "pylsp",
        -- "pylyzer",
        -- "pyright",
        -- "ruff",
        "somesass_ls",
        "taplo",
        "ts_ls",
        "vtsls",
        "yamlls",
      },
    })

    -- automatically install ensure_installed servers
    mason_lspconfig.setup_handlers({
      -- Will be called for each installed server that doesn't have
      -- a dedicated handler.
      --
      function(server_name) -- default handler (optional)
        -- https://github.com/neovim/nvim-lspconfig/pull/3232
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        require("lspconfig")[server_name].setup({

          capabilities = capabilities,
        })
      end,
    })
  end,
}
