vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		local snacks = require("snacks")

		-- map("gd", snacks.picker.lsp_definitions, "Goto Definition")
		-- map("gr", snacks.picker.lsp_references, "Goto Reference")
		map("K", function()
			vim.lsp.buf.hover({ border = "rounded" })
		end, "Hover Documentation")
		map("gI", vim.lsp.buf.implementation, "Goto Implementation")
		map("<leader>uv", function()
			local virtual_lines_config = not vim.diagnostic.config().virtual_lines.current_line
			vim.diagnostic.config({
				virtual_lines = { current_line = virtual_lines_config },
			})
		end, "Toggle virtual lines")
		-- map("gT", vim.lsp.buf.type_definition, "Goto Type Definition")
		-- map("gR", vim.lsp.buf.references, "Goto References")
		-- map("gl", vim.lsp.buf.format, "Format")
	end,
})

vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})
