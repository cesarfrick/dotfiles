return {
	"hrsh7th/nvim-cmp",
	-- load cmp on InsertEnter
	event = "InsertEnter",
	-- enabled = false,
	-- these dependencies will only be loaded when cmp loads
	-- dependencies are always lazy-loaded unless specified otherwise
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-path",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		"Exafunction/codeium.nvim",
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")

		cmp.setup({
			mapping = {
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
			},
			completion = {
				completeop = "menu,menuone,preview,noselect",
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "codeium" },
				{ name = "path" },
				{ name = "buffer" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "friendly-snippets" },
				-- {
				-- 	name = "cmp_tabnine",
				-- 	group_index = 1,
				-- 	priority = 100,
				-- },
			},
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end,
			},
			formatting = {
				fields = { "abbr", "kind", "menu" },
				expandable_indicator = true,
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 50,
					ellipsis_char = "...",
					symbol_map = { Codeium = "" },
					show_labelDetails = true,
				}),
			},
		})
	end,
}
