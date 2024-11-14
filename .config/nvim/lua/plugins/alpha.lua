return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  -- enabled = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local alpha = require("alpha")
    local theme = require("alpha.themes.dashboard")
    local headers = require("ui.headers")

    theme.section.header.val = headers[2]

    theme.section.buttons.val = {
      theme.button("f", " Find file", ":Telescope find_files<CR>"),
      theme.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
      theme.button("p", "  Find project", ":Telescope projects<CR>"),
      theme.button("r", "  Recently used files", ":Telescope oldfiles<CR>"),
      theme.button("t", "  Find text", ":Telescope live_grep<CR>"),
      theme.button("s", "  Restore last session", ":SessionRestore<CR>"),
      theme.button("l", "  Load a session", ":SessionSearch<CR>"),
      theme.button(
        "c",
        "  Configuration",
        ":lua require'telescope.builtin'.find_files({ cwd = '~/.config/nvim' })<CR>"
      ),
      theme.button("q", "  Quit Neovim", ":qa<CR>"),
    }

    alpha.setup(theme.config)
  end,

  vim.keymap.set("n", "<Leader>wd", "<cmd>Alpha<CR>", { noremap = true, silent = true }),
}
