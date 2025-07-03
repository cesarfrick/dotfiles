return {
	init_options = { hostInfo = "neovim" },
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = {
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"javascript",
		"javascriptreact",
		"javascript.jsx",
	},
	root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
	workspace_required = false,
	single_file_support = false,
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
	handlers = {
		["_typescript.rename"] = function(_, result, ctx)
			local client = assert(vim.lsp.get_client_by_id(ctx.client_id))
			vim.lsp.util.show_document({
				uri = result.textDocument.uri,
				range = {
					start = result.position,
					["end"] = result.position,
				},
			}, client.offset_encoding)
			vim.lsp.buf.rename()
			return vim.NIL
		end,
	},
}
