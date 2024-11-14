return {
	"mxsdev/nvim-dap-vscode-js",
	dependencies = {
		"mfussenegger/nvim-dap",
	},
	lazy = true,
	config = function()
		local dap = require("dap")
		local langs = {
			"typescript",
			"javascript",
			"typescriptreact",
			"javascriptreact",
		}

		require("dap-vscode-js").setup({
			debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
			adapters = {
				"chrome",
				"pwa-node",
				"pwa-chrome",
				"pwa-msedge",
				"node-terminal",
				"pwa-extensionHost",
				"node",
			},
		})

		for _, lang in ipairs(langs) do
			dap.configurations[lang] = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-chrome",
					request = "launch",
					name = "Launch Chrome",
					url = "http://localhost:3000",
					webRoot = "${workspaceFolder}",
					userDataDir = "${workspaceFolder}/.vscode-insiders/vscode-chrome-debug-userdatadir",
				},
				{
					type = "pwa-chrome",
					request = "attach",
					name = "Attach",
					port = 9222,
					cwd = "${workspaceFolder}",
				},
			}
		end
	end,
}
