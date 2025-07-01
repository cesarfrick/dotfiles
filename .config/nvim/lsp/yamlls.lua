return {
	dependencies = { "b0o/schemastore.nvim" },
	filetypes = { "yml", "yaml" },
	settings = {
		yaml = {
			schemaStore = {
				enable = false,
				url = "",
			},
			schemas = require("schemastore").yaml.schemas(),
			validate = { enable = true },
		},
	},
}
