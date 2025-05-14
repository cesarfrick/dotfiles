return {
	"mxsdev/nvim-dap-vscode-js",
	-- enabled = false,
	dependencies = {
		"mfussenegger/nvim-dap",
		{
			"microsoft/vscode-js-debug",
			version = "1.x",
			build = "npm install && npm run compile vsDebugServerBundle && mv dist out",
		},
	},
	config = function()
		local dap = require("dap")
		local dap_vscode = require("dap-vscode-js")
		local filetypes = {
			"typescript",
			"javascript",
			"typescriptreact",
			"javascriptreact",
		}

		dap_vscode.setup({
			debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
			adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
		})

		for _, adapter in pairs({ "node", "chrome" }) do
			local pwa_adapter = "pwa-" .. adapter

			dap.adapters[pwa_adapter] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "js-debug-adapter",
					args = { "${port}" },
				},
				-- enrich_config = function(config, options)
				-- 	config.type = pwa_adapter
				-- 	on_config(config)
				-- end,
			}

			dap.adapters[adapter] = dap.adapters[pwa_adapter]
		end
		for _, language in ipairs(filetypes) do
			dap.configurations[language] = {
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach to existing Node process",
					processId = require("dap.utils").pick_process,
					port = 9229,
					sourceMaps = true,
					resolveSourceMapLocations = {
						"${workspaceFolder}/**",
						"!**/node_modules/**",
					},
					skipFiles = {
						"${workspaceFolder}/node_modules/**/*.js",
					},
				},
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch current file in new Node process",
					program = "${file}",
				},
				{
					type = "pwa-chrome",
					request = "launch",
					name = "Launch Chrome Browser",
					url = "http://localhost:8080",
					webRoot = "${workspaceFolder}",
					protocol = 9222,
					skipFiles = { "**/node_modules/**/*", "dist/**/*" },
				},
			}
		end
	end,
}
