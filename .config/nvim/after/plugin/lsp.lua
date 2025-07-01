vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end

		local snacks = require("snacks")

		map("gd", snacks.picker.lsp_definitions, "Goto Definition")
		map("gr", snacks.picker.lsp_references, "Goto Reference")
		map("<leader>D", snacks.picker.lsp_type_definitions, "Type Definition")
		map("<leader>ds", snacks.picker.lsp_symbols, "Document Symbols")
		map("<leader>ws", snacks.picker.lsp_workspace_symbols, "Workspace Symbols")
		map("<leader>rn", vim.lsp.buf.rename, "Rename")
		map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
		map("<leader>q", vim.diagnostic.setloclist, "Quickfix")
		map("<leader>lo", vim.diagnostic.open_float, "Open Float")
		map("K", function()
			vim.lsp.buf.hover({ border = "rounded" })
		end, "Hover Documentation")
		map("gD", vim.lsp.buf.declaration, "Goto Declaration")
		map("gI", vim.lsp.buf.implementation, "Goto Implementation")
		map("<leader>uv", function()
			local virtual_lines_config = not vim.diagnostic.config().virtual_lines
			vim.diagnostic.config({ virtual_lines = virtual_lines_config, virtual_text = not virtual_lines_config })
		end, "Toggle virtual lines")
		-- map("gT", vim.lsp.buf.type_definition, "Goto Type Definition")
		-- map("gR", vim.lsp.buf.references, "Goto References")
		-- map("gl", vim.lsp.buf.format, "Format")
	end,
})
