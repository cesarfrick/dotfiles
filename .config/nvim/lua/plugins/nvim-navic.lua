-- A simple statusline/winbar component that uses LSP to show your current code context.
if false then
	return {}
end

return {
	"SmiteshP/nvim-navic",
	-- dependencies = { "neovim/nvim-lspconfig" },
	opts = {
		lsp = {
			auto_attach = true,
			preference = {
				"ts_ls",
				"basedpyright",
			},
		},
		highlight = true,
		click = true,
	},
	config = function(_, opts)
		require("nvim-navic").setup(opts)

		vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
	end,
}
