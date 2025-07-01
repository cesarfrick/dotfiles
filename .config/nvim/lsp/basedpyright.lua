return {
	filetypes = { "python" },
	cmd = { "basedpyright" },
	settings = {
		basedpyright = {
			analysis = {
				diagnosticMode = "openFilesOnly",
				typecheckingMode = "basic",
				useLibraryCodeForTypes = true,
				inlayHints = {
					callArgumentNames = true,
				},
			},
		},
	},
}
