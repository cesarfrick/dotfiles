---@brief
---
--- https://github.com/golang/tools/tree/master/gopls
---
--- Google's lsp server for golang.

local mod_cache = nil
local settings_conf = {
	settings = {
		gofumpt = true,
		codelenses = {
			upgrade_dependency = true,
			vendor = true,
			tidy = true,
		},
		hints = {
			assignVariableTypes = true,
			compositeLiteralFields = true,
			compositeLiteralTypes = true,
			constantValues = true,
			functionTypeParameters = true,
			parameterNames = true,
			rangeVariableTypes = true,
		},
		analysis = {
			nilness = true,
			unusedparams = true,
			useany = true,
		},
		usePlaceholders = true,
		completeUnimported = true,
		staticcheck = true,
	},
}

---@param fname string
---@return string?
local function get_root(fname)
	if mod_cache and fname:sub(1, #mod_cache) == mod_cache then
		local clients = vim.lsp.get_clients({ name = "gopls" })
		if #clients > 0 then
			return clients[#clients].config.root_dir
		end
	end
	return vim.fs.root(fname, "go.work") or vim.fs.root(fname, "go.mod") or vim.fs.root(fname, ".git")
end

return {
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = function(bufnr, on_dir)
		local fname = vim.api.nvim_buf_get_name(bufnr)
		-- see: https://github.com/neovim/nvim-lspconfig/issues/804
		if mod_cache then
			on_dir(get_root(fname))
			return
		end
		local cmd = { "go", "env", "GOMODCACHE" }
		vim.system(cmd, { text = true }, function(output)
			if output.code == 0 then
				if output.stdout then
					mod_cache = vim.trim(output.stdout)
				end
				on_dir(get_root(fname))
			else
				vim.schedule(function()
					vim.notify(("[gopls] cmd failed with code %d: %s\n%s"):format(output.code, cmd, output.stderr))
				end)
			end
		end)
	end,
	settings = settings_conf,
}

-- return {
--   cmd = { "gopls", "serve" },
--   filetypes = { "go", "gomod", "gowork", "gotmpl", "gosum" },
--   root_markers = { "go.work", "go.mod", ".git" },
--   settings = settings_conf,
-- }
