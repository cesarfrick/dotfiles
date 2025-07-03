return {
	dependencies = { "b0o/schemastore.nvim" },
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yml", "yaml", "yaml.docker-compose", "yaml.gitlab", "yaml.helm-values" },
	root_markers = { ".git" },
	settings = {
		redhat = {
			telemetry = {
				enabled = false,
			},
		},
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
