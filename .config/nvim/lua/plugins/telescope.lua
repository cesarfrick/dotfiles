return {
  {
    "nvim-telescope/telescope.nvim",
    -- enabled = false,
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "folke/todo-comments.nvim",
      -- {
      --   "nvim-telescope/telescope-fzf-native.nvim",
      --   build = "make",
      --   enabled = true,
      -- },
      -- "nvim-telescope/telescope-ui-select.nvim",
      -- {
      --   "nvim-telescope/telescope-file-browser.nvim",
      --   enabled = true,
      -- },
    },
    --     config = function()
    --       local map = vim.keymap.set
    --       local telescope = require("telescope")
    --       local builtin = require("telescope.builtin")
    --       local actions = require("telescope.actions")
    --
    --       telescope.setup({
    --         defaults = {
    --           sorting_strategy = "ascending",
    --           layout_config = {
    --             prompt_position = "top",
    --           },
    --           file_ignore_patterns = { ".git/", "node_modules", "py3nvim" },
    --           mappings = {
    --             i = {
    --               ["<C-k>"] = actions.move_selection_previous,                -- move to previous result
    --               ["<C-j>"] = actions.move_selection_next,                    -- move to next result
    --               ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
    --             },
    --           },
    --         },
    --         extensions = {
    --           file_browswer = {
    --             path = "%:p:h",   -- open from within the folder of your current buffer
    --             display_stat = false, -- don't show file stat
    --             grouped = true,   -- group initial sorting by directories and then files
    --             hidden = true,    -- show hidden files
    --             hide_parent_dir = true, -- hide `../` in the file browser
    --             hijack_netrw = true, -- use telescope file browser when opening directory paths
    --             prompt_path = true, -- show the current relative path from cwd as the prompt prefix
    --             use_fd = true,    -- use `fd` instead of plenary, make sure to install `fd`
    --           },
    --           ["ui-select"] = {
    --             require("telescope.themes").get_dropdown({
    --               -- even more opts
    --             }),
    --           },
    --         },
    --       })
    --       -- To get ui-select loaded and working with telescope, you need to call
    --       -- load_extension, somewhere after setup function:
    --       -- telescope.load_extension("fzf")
    --       telescope.load_extension("ui-select")
    --
    --       map("n", "-", "<cmd>Telescope file_browser<CR>", { desc = "Open File Browser" })
    --       map("n", "<leader><leader>", builtin.find_files, { desc = "Search files" })
    --       map("n", "<leader>fg", builtin.live_grep, { desc = "Search by Grep", noremap = true })
    --       map("n", "<leader>fs", builtin.buffers, { desc = "Search open buffers" })
    --       map("n", "<leader>fG", builtin.git_files, { desc = "Search git files" })
    --       map("n", "<leader>fd", builtin.diagnostics, { desc = "Search Diagnostics" })
    --       map("n", "<leader>fh", builtin.help_tags, { desc = "Search help tags" })
    --       map("n", "<leader>fm", builtin.man_pages, { desc = "Search Man Pages" })
    --       map("n", "<leader>fr", builtin.resume, { desc = "Search Resume" })
    --       map("n", "<leader>fc", function()
    --         builtin.find_files({ cwd = vim.fn.stdpath("config") })
    --       end, { desc = "Search config files" })
    --       map("n", "<leader>ft", "<cmd>TodoTelescope<CR>", { desc = "Search Todos" })
    --     end,
  },
}
