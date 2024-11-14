return {
	"b0o/schemastore.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local schemastore = require("schemastore")
		lspconfig.jsonls.setup({
			settings = {
				json = {
					schemas = schemastore.json.schemas(),
					validate = { enable = true },
				},
			},
		})

		lspconfig.yamlls.setup({
			settings = {
				yaml = {
					schemaStore = {
						enable = false,
						url = "",
					},
					schemas = schemastore.yaml.schemas(),
					validate = { enable = true },
				},
			},
		})
	end,
}
