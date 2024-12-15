return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  enabled = true,
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local nvim_lsp = require("cmp_nvim_lsp")
    capabilities = nvim_lsp.default_capabilities(capabilities)
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    lspconfig.inlayHints = {
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    }

    lspconfig.codelens = {
      enabled = true,
    }

    -- require("lspconfig.configs").vtsls = require("vtsls").lspconfig
    lspconfig.emmet_language_server.setup({})

    lspconfig.astro.setup({
      cmd = { "astro-ls", "--stdio" },
      capabilities = capabilities,
      filetypes = { "astro" },
    })

    lspconfig.cssls.setup({
      capabilities = capabilities,
    })

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
          },
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            -- Do not send telemetry data containing a randomized but unique identifier
            enable = false,
          },
          hint = {
            enable = true,
          },
        },
      },
    })

    -- lspconfig.ruff.setup({
    -- 	init_options = {
    -- 		setting = {
    -- 			lint = {
    -- 				preview = true,
    -- 				pyflakes = {
    -- 					allowedUnusedImports = {
    -- 						"bracket.app",
    -- 						"kintaro_preview_external.*",
    -- 					},
    -- 				},
    -- 			},
    -- 		},
    -- 	},
    -- })

    -- lspconfig.basedpyright.setup({
    --   basedpyright = {
    --     disableOrganizeImports = true,
    --     openFilesOnly = true,
    --     analysis = {
    --       autoImportCompletion = true,
    --       autoSearchPaths = true,
    --       useLibraryCodeForTypes = true,
    --       diagnosticMode = "openFilesOnly",
    --       typeCheckingMode = "basic",
    --       diagnosticSeverityOverrides = {
    --         reportOptionalSubscript = "ignore",
    --       },
    --     },
    --   },
    -- })

    -- lspconfig.pyright.setup({
    --   capabilities = capabilities,
    --   settings = {
    --     pyright = {
    --       autoImportCompletion = true,
    --       disableOrganizeImports = true,
    --     },
    --     python = {
    --       analysis = {
    --         ignore = { "*" },
    --       },
    --       -- analysis = {
    --       --   autoSearchPaths = true,
    --       --   diagnosticMode = "openFilesOnly",
    --       --   useLibraryCodeForTypes = true,
    --       --   typeCheckingMode = "off",
    --       --   diagnosticSeverityOverrides = {
    --       --     reportOptionalSubscript = "information",
    --       --   },
    --       -- },
    --     },
    --   },
    -- })

    -- lspconfig.deno.setup({
    --   root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
    --   init_options = {
    --     lint = true,
    --   },
    -- })

    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
      cmd = { "typescript-language-server", "--stdio" },
      settings = {
        typescript = {
          format = {
            enable = true,
          },
          diagnostics = {
            enable = true,
          },
        },
        javascript = {
          format = {
            enable = true,
          },
          diagnostics = {
            enable = true,
          },
        },
        completions = {
          completeFunctionCalls = true,
        },
      },
      -- root_dir = nvim_lsp.util.root_pattern("package.json"),
      -- single_file_support = false,
    })

    lspconfig.taplo.setup({
      filetypes = { "toml" },
      root_dir = require("lspconfig.util").root_pattern("*.toml", ".git"),
    })

    -- lspconfig.vtsls.setup({
    --   capabilities = capabilities,
    --   filetypes = {
    --     "typescript",
    --     "typescriptreact",
    --     "typescript.tsx",
    --     -- 'javascript',
    --     -- 'javascriptreact',
    --     -- 'javascript.jsx',
    --   },
    --   -- cmd = { "typescript-language-server", "--stdio" },
    --   cmd = { "vtsls", "--stdio" },
    --   settings = {
    --     typescript = {
    --       format = {
    --         enable = true,
    --       },
    --       diagnostics = {
    --         enable = true,
    --       },
    --     },
    --     -- javascript = {
    --     --   format = {
    --     --     enable = true,
    --     --   },
    --     --   diagnostics = {
    --     --     enable = true,
    --     --   },
    --     -- },
    --     completions = {
    --       completeFunctionCalls = true,
    --     },
    --   },
    -- })

    vim.keymap.set("n", "<leader>cK", vim.lsp.buf.hover, { desc = "Hover" })
    vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "Go to definition" })
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })

    if vim.lsp.inlay_hint then
      vim.keymap.set("n", "<leader>ci", function()
        local status = vim.lsp.inlay_hint.is_enabled({})
        vim.lsp.inlay_hint.enable(not status)
      end, { desc = "Toggle inlay hints" })
    end
  end,
}
