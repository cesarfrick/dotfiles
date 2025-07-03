return {
	"SmiteshP/nvim-navic",
	-- dependencies = { "neovim/nvim-lspconfig" },
	event = "VeryLazy",
	config = function()
		local navic = require("nvim-navic")
		-- local lsp = require("lspconfig")

		local on_attach = function(client, bufnr)
			if client.server_capabilities.documentSymbolProvider then
				navic.attach(client, bufnr)
			end
		end

		navic.setup({
			click = true,
			highlight = true,
			icons = {
				File = " ",
				Module = " ",
				Namespace = " ",
				Package = " ",
				Class = " ",
				Method = " ",
				Property = " ",
				Field = " ",
				Constructor = " ",
				Enum = " ",
				Interface = " ",
				Function = " ",
				Variable = " ",
				Constant = " ",
				String = " ",
				Number = " ",
				Boolean = " ",
				Array = " ",
				Object = " ",
				Key = " ",
				Null = " ",
				EnumMember = " ",
				Struct = " ",
				Event = " ",
				Operator = " ",
				TypeParameter = " ",
			},
		})

		-- lsp.pyright.setup({
		--   on_attach = on_attach,
		-- })

		-- lsp.ts_ls.setup({
		--   on_attach = on_attach,
		-- })

		-- lsp.jinja_lsp.setup({
		--   on_attach = on_attach,
		-- })

		vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
	end,
}
