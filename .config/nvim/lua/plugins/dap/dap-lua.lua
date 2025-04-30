return {
	"jbyuki/one-small-step-for-vimkind",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		local dap = require("dap")
		local map = vim.keymap.set

		dap.configurations.lua = {
			{
				type = "nlua",
				request = "attach",
				name = "Attach to running Neovim instance",
			},
		}

		dap.adapters.nlua = function(callback, conf)
			callback({ type = "server", host = conf.host or "127.0.0.1", port = conf.port or 8086 })
		end

		map("n", "<F5>", [[:lua require('osv').launch({ port = 8086 })<CR>]], { desc = "Launch Lua Debugger" })
	end,
}
