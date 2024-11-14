return {
	"mfussenegger/nvim-dap-python",
	lazy = true,
	ft = "python",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	config = function()
		local dap = require("dap")
		require("dap-python").setup("python")

		table.insert(dap.configurations.python, {
			type = "python",
			request = "launch",
			name = "Launch file",
			program = "${file}",
		})
	end,
}
