return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  opts = {
    bottom = {
      -- toggleterm / lazyterm at the bottom with a height of 40% of the screen
      {
        ft = "snacks_terminal",
        size = { height = 0.4 },
        -- exclude floating windows
        -- filter = function(_, win)
        --   return vim.api.nvim_win_get_config(win).relative == ""
        -- end,
        title = "%{b:snacks_terminal.id}: %{b:term_title}",
        filter = function(_buf, win)
          return vim.w[win].snacks_win
              and vim.w[win].snacks_win.position == pos
              and vim.w[win].snacks_win.relative == "editor"
              and not vim.w[win].trouble_preview
        end,
      },
      {
        ft = "lazyterm",
        title = "LazyTerm",
        size = { height = 0.4 },
        filter = function(buf)
          return not vim.b[buf].lazyterm_cmd
        end,
      },
      "Trouble",
      {
        ft = "qf",
        title = "QuickFix",
      },
      {
        ft = "help",
        size = {
          height = 30,
        },
        -- only show help buffers
        filter = function(buf)
          return vim.bo[buf].buftype == "help"
        end,
      },
      {
        ft = "spectre_panel",
        size = {
          height = 0.4,
        },
      },
      -- "Noice",
      -- { ft = "noice", size = { height = 0.4 } },
    },
    -- left = {
    -- 	-- Neo-tree filesystem always takes half the screen height
    -- 	{
    -- 		title = "Neo-Tree",
    -- 		ft = "neo-tree",
    -- 		filter = function(buf)
    -- 			return vim.b[buf].neo_tree_source == "filesystem"
    -- 		end,
    -- 		size = { height = 0.5 },
    -- 	},
    -- 	{
    -- 		title = "Neo-Tree Git",
    -- 		ft = "neo-tree",
    -- 		filter = function(buf)
    -- 			return vim.b[buf].neo_tree_source == "git_status"
    -- 		end,
    -- 		pinned = true,
    -- 		open = "Neotree position=right git_status",
    -- 	},
    -- 	{
    -- 		title = "Neo-Tree Buffers",
    -- 		ft = "neo-tree",
    -- 		filter = function(buf)
    -- 			return vim.b[buf].neo_tree_source == "buffers"
    -- 		end,
    -- 		pinned = true,
    -- 		open = "Neotree position=top buffers",
    -- 	},
    -- 	-- {
    -- 	-- 	ft = "Outline",
    -- 	-- 	pinned = true,
    -- 	-- 	open = "SymbolsOutlineOpen",
    -- 	-- },
    -- 	-- any other neo-tree windows
    -- 	"neo-tree",
    -- },
    right = {
      {
        title = "Symbols",
        ft = "Outline",
        size = {
          height = 0.5,
          width = 0.3,
        },
      },
    },
  },
}
