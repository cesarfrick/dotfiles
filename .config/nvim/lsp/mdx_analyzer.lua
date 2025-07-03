---@brief
--- https://github.com/mdx-js/mdx-analyzer
---
--- `mdx-analyzer`, a language server for MDX

return {
	cmd = { "mdx-language-server", "--stdio" },
	filetypes = { "mdx" },
	root_markers = { "package.json" },
	settings = {},
	init_options = {
		typescript = {},
	},
}
