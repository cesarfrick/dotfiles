return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  -- ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    "BufReadPre "
    .. vim.fn.expand("~")
    .. "/Documents/obsidian/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/Documents/obsidian/**.md",
    -- "BufReadPre " .. vim.fn.expand("~") .. "/Documents/Personal Notes/**.md",
    -- "BufNewFile " .. vim.fn.expand("~") .. "/Documents/Personal Notes/**.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local obsidian = require('obsidian')
    vim.opt_local.conceallevel = 2

    obsidian.setup({
      workspaces = {
        {
          name = "work",
          path = "~/Documents/obsidian/",
        },
      }
    })
  end
}
