-- local node_path = vim.env.HOME .. "/.local/share/mise/installs/node/latest/bin"
-- vim.env.PATH = node_path .. ":" .. vim.env.PATH
-- vim.g.python3_host_prog = vim.env.HOME .. "/.config/nvim/.py3nvim/bin/python3"
-- vim.g.node_host_prog = vim.env.HOME .. "/.local/share/yarn/global/node_modules/neovim/bin/cli.js"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local settings = require("core.settings")

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local function register_plugins()
  local response = {}

  for i = 1, #settings.plugin_paths do
    table.insert(response, { import = settings.plugin_paths[i] })
  end

  return response
end

require("core")
require("lazy").setup(register_plugins(), {
  checker = {
    enabled = true,
    notify = false,
  },
})

vim.cmd.colorscheme(settings.theme)
