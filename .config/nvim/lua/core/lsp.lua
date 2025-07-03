vim.lsp.enable({
	"astro",
	"basedpyright",
	"bashls",
	"gopls",
	"html",
	"htmx",
	"jinja_lsp",
	"jsonls",
	"lua_ls",
	"taplo",
	"ts_ls",
	"yamlls",
})

vim.diagnostic.config({
	virtual_lines = true,
	virtual_text = false,
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
