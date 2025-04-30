return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    {
      "antosha417/nvim-lsp-file-operations",
      config = true,
    },
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local util = require("lspconfig/util")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local navic = require("nvim-navic")
    local lsp_servers = {
      astro = {
        cmd = { "astro-ls", "--stdio" },
        filetypes = { "astro" },
      },
      basedpyright = {
        analysis = {
          diagnosticMode = "openFilesOnly",
          typecheckingMode = "basic",
          useLibraryCodeForTypes = true,
        },
      },
      gopls = {
        cmd = { "gopls", "serve" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
      },
      jinja_lsp = {
        name = "jinja-lsp",
        cmd = { "/Users/frickmijares/.cargo/bin/jinja-lsp" },
        filetypes = { "jinja", "jinja.html", "jinja2", "jinja2.html" },
        settings = {
          jinja_lsp = {
            enable = true,
          },
        },
      },
      lua_ls = {
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
      },
      -- pyright = {
      --   settings = {
      --     pyright = {
      --       autoImportCompletion = true,
      --     },
      --     python = {
      --       analysis = {
      --         autoSearchPaths = true,
      --         diagnosticMode = "openFilesOnly",
      --         useLibraryCodeForTypes = true,
      --         -- typeCheckingMode = "off",
      --         diagnosticSeverityOverrides = {
      --           reportOptionalSubscript = "information",
      --         },
      --       },
      --     },
      --   },
      -- },
      ts_ls = {
        -- root_dir = util.root_pattern("package.json"),
        root_markers = { "package.json" },
        workspace_required = true,
        single_file_support = false,
        filetypes = {
          "typescript",
          "typescriptreact",
          "typescript.tsx",
          "javascript",
          "javascriptreact",
          "javascript.jsx",
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
      },

      denols = {
        -- root_dir = util.root_pattern("deno.json", "deno.jsonc"),
        root_markers = { "deno.json", "deno.jsonc" },
        workspace_required = true,
        init_options = { config = "./deno.jsonc", lint = true },
      },
    }

    lspconfig.inlayHints = {
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    }

    for server_name, config in pairs(lsp_servers) do
      config.capabilities = capabilities

      config.on_attach = function(client, bufnr)
        if config.mappings then
          require("config.mappings").lsp_mappings(bufnr)
        end

        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end
      end

      require("lspconfig")[server_name].setup(config)
    end

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
