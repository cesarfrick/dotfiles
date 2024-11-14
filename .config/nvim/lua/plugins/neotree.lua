return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    local ntcommand = require("neo-tree.command")
    local map = vim.keymap.set

    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

    require("neo-tree").setup({
      source_selector = {
        -- winbar = true,
        statusline = false,
        source = "filesystem",
        -- sources = {
        -- 	{ source = "filesystem" },
        -- 	{ source = "git_status" },
        -- 	{ source = "buffers" },
        -- 	{ source = "document_symbols" },
        -- },
      },
      close_if_last_window = true,
      window = {
        enable_git_status = true,
        enable_diagnostics = true,
        open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "Outline", "egdy" },
        border = "rounded",
      },
      filesystem = {
        follow_current_file = { enabled = true },
        hide_gitignored = false,
        count_in_git_status = true,
        count_hidden = true,
        use_libuv_file_watcher = true,
      },
      default_component_configs = {
        diagnostics = {
          symbols = {
            hint = "󰌵",
            info = "",
            warn = "",
            error = "",
          },
          highlights = {
            hint = "DiagnosticSignHint",
            info = "DiagnosticSignInfo",
            warn = "DiagnosticSignWarn",
            error = "DiagnosticSignError",
          },
        },
        icon = {
          folder_closed = "",
          folder_open = "",
          folder_empty = "󰜌",
        },
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          file_nesting = true,
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
        name = {
          trailing_slash = false,
          use_git_status_colors = true,
          highlight = "NeoTreeFileName",
        },
        git_status = {
          symbols = {
            -- Change type
            added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = "✖", -- this can only be used in the git_status source
            renamed = "󰁕", -- this can only be used in the git_status source
            -- Status type
            untracked = "",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          },
        },
      },
    })

    map(
      "n",
      "<leader>e",
      function()
        ntcommand.execute({ show = true, toggle = true, position = "left" })
      end,
      -- ":Neotree position=left dir=vim.uv.fs_root() toggle<CR>",
      -- table.merge({ desc = "Toggle Sidebar Explorer" }, opts)
      { noremap = true, silent = true, desc = "Toggle Sidebar Explorer" }
    )
    map(
      "n",
      "<leader>fg",
      function()
        ntcommand.execute({ toggle = true, source = "git_status", position = "float" })
      end,
      -- ":Neotree position=float source=git_status toggle<CR>",
      { noremap = true, silent = true, desc = "Toggle Git Explorer" }
    )
    map(
      "n",
      "<leader>fb",
      function()
        ntcommand.execute({ toggle = true, source = "buffers", position = "float" })
      end,
      -- ":Neotree position=float source=buffers toggle<CR>",
      { noremap = true, silent = true, desc = "Toggle Buffer Explorer" }
    )
    map(
      "n",
      "<leader>ff",
      function()
        ntcommand.execute({ toggle = true, source = "filesystem", position = "float" })
      end,
      -- ":Neotree position=float source=filesystem toggle<CR>",
      { noremap = true, silent = true, desc = "Toggle File Explorer" }
    )
  end,
}
