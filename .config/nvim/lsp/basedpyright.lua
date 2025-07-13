return {
	cmd = { "basedpyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = {
		".git",
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		"pyrightconfig.json",
	},
	settings = {
		basedpyright = {
			analysis = {
				autoSearchPaths = true,
				autoImportCompletions = true,
				diagnosticMode = "openFilesOnly",
				typecheckingMode = "basic",
				useLibraryCodeForTypes = true,
				inlayHints = {
					variableTypes = false,
					callArgumentNames = true,
					genericTypes = true,
				},
			},
		},
	},
}
