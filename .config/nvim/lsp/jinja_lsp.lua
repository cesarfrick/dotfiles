return {
	name = "jinja_lsp",
	cmd = { "jinja-lsp", "--stdio" },
	-- cmd = { "/Users/frickmijares/.cargo/bin/jinja-lsp" },
	filetypes = { "jinja", "jinja.html", "jinja2", "jinja2.html" },
	root_markers = { ".git" },
	settings = {
		jinja_lsp = {
			enable = true,
		},
	},
}
