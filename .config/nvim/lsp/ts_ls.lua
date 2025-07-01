return {
	root_markers = { "package.json" },
	workspace_required = false,
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
}
