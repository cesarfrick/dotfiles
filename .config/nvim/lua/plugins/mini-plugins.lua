-- mini.nvim plugins
--
return {
	{ "echasnovski/mini.trailspace", event = "VeryLazy", version = "*" },
	{ "echasnovski/mini.ai", event = "VeryLazy", version = "*" },
	{ "echasnovski/mini.hipatterns", version = "*" },
	{
		"echasnovski/mini.diff",
		dependencies = {
			"echasnovski/mini.icons",
		},
		event = "VeryLazy",
		version = "*",
		config = function()
			require("mini.diff").setup()
		end,
	},
	{
		"echasnovski/mini.pairs",
		dependencies = { "hrsh7th/nvim-cmp" },
		version = "*",
		event = "InsertEnter",
		config = function(_, opts)
			require("mini.pairs").setup(opts)
		end,
	},
	{ "echasnovski/mini.comment", event = "VeryLazy", version = "*" },
	{
		"echasnovski/mini.animate",
		-- recommended = true,
		event = "VeryLazy",
		opts = function()
			-- don't use animate when scrolling with the mouse
			local mouse_scrolled = false
			for _, scroll in ipairs({ "Up", "Down" }) do
				local key = "<ScrollWheel" .. scroll .. ">"
				vim.keymap.set({ "", "i" }, key, function()
					mouse_scrolled = true
					return key
				end, { expr = true })
			end

			local animate = require("mini.animate")
			return {
				resize = {
					timing = animate.gen_timing.linear({ duration = 50, unit = "total" }),
				},
				scroll = {
					timing = animate.gen_timing.linear({ duration = 150, unit = "total" }),
					subscroll = animate.gen_subscroll.equal({
						predicate = function(total_scroll)
							if mouse_scrolled then
								mouse_scrolled = false
								return false
							end
							return total_scroll > 1
						end,
					}),
				},
			}
		end,
	},
	{
		"echasnovski/mini.indentscope",
		version = "*", -- wait till new 0.7.0 release to put it back on semver
		event = "BufWinEnter",
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"alpha",
					"dashboard",
					"fzf",
					"help",
					"lazy",
					"lazyterm",
					"mason",
					"neo-tree",
					"notify",
					"toggleterm",
					"Trouble",
					"trouble",
					"snacks_dashboard",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
		end,
	},
	{
		"echasnovski/mini.surround",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			mappings = {
				add = "gsa",
				delete = "gsd",
				replace = "gsr",
				find = "gsf",
				find_left = "gsF",
				highlight = "gsh",
				update_n_lines = "gsn",
			},
		},
	},
	{
		"echasnovski/mini.files",
		dependencies = {
			{ "echasnovski/mini.icons", version = "*" },
		},
		version = "*",
		config = function()
			local map = vim.keymap.set
			local MiniFiles = require("mini.files")

			MiniFiles.setup({
				windows = {
					preview = true,
				},
			})

			MiniFiles.get_explorer_state()

			local show_dotfiles = true

			local filter_show = function()
				return true
			end

			local filter_hide = function(fs_entry)
				return not vim.startswith(fs_entry.name, ".")
			end

			local toggle_dotfiles = function()
				show_dotfiles = not show_dotfiles
				local new_filter = show_dotfiles and filter_show or filter_hide
				MiniFiles.refresh({ content = { filter = new_filter } })
			end

			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniFilesBufferCreate",
				callback = function(args)
					local buf_id = args.data.buf_id
					-- Tweak left-hand side of mapping to your liking
					map("n", "g.", toggle_dotfiles, { buffer = buf_id, desc = "MiniFiles toggle dotfiles" })
				end,
			})

			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniFilesActionRename",
				callback = function(event)
					Snacks.rename.on_rename_file(event.data.from, event.data.to)
				end,
			})
			local map_split = function(buf_id, lhs, direction)
				local rhs = function()
					-- Make new window and set it as target
					local cur_target = MiniFiles.get_explorer_state().target_window
					local new_target = vim.api.nvim_win_call(cur_target, function()
						vim.cmd(direction .. " split")
						return vim.api.nvim_get_current_win()
					end)

					MiniFiles.set_target_window(new_target)
				end

				-- Adding `desc` will result into `show_help` entries
				local desc = "Split " .. direction
				map("n", lhs, rhs, { buffer = buf_id, desc = desc })
			end

			vim.api.nvim_create_autocmd("User", {
				pattern = "MiniFilesBufferCreate",
				callback = function(args)
					local buf_id = args.data.buf_id
					-- Tweak keys to your liking
					map_split(buf_id, "<C-s>", "belowright horizontal")
					map_split(buf_id, "<C-v>", "belowright vertical")
				end,
			})

			map("n", "<leader>m", ":lua MiniFiles.open()<cr>", { desc = "Open Files", silent = true, noremap = true })
		end,
	},
}
