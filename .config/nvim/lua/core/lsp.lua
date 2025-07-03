vim.lsp.enable({
	"astro",
	"basedpyright",
	"bashls",
	"cssls",
	"cssmodules_ls",
	"css_variables",
	"gopls",
	"html",
	"htmx",
	"jinja_lsp",
	"jsonls",
	"lua_ls",
	"pylsp",
	"stylelint_lsp",
	"taplo",
	"ts_ls",
	"yamlls",
})

vim.diagnostic.config({
	-- virtual_lines = true,
	virtual_lines = {
		current_line = true,
	},
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
