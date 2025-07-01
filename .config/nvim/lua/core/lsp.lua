vim.lsp.enable({
	"astro",
	"basedpyright",
	"bashls",
	"gopls",
	"jinja_lsp",
	"jsonls",
	"lua_ls",
	"ts_ls",
	"yamlls",
})

vim.lsp.inlay_hint.enable(false)

vim.diagnostic.config({
	-- virtual_lines = true,
	virual_text = false,
	update_in_insert = false,
	severity_sort = true,
	float = {
		source = true,
		border = "rounded",
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})
