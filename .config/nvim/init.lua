local node_bin = vim.env.HOME .. "/.local/share/mise/shims/node"
local py_venv = vim.env.HOME .. "/.config/nvim/.py3nvim/"
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local settings = require("core.settings")

vim.env.PATH = vim.env.PATH .. node_bin .. ":"
vim.g.python3_host_prog = py_venv .. "bin/python3"
vim.g.node_host_prog = py_venv .. "node_modules/neovim/bin/cli.js"
vim.g.user_emmet_mode = "n"
vim.g.user_emmet_leader_key = ","

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
-- Prepend mise shims to PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH
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

local function register_plugins(plugins)
  local response = {}

  for _, plugin in ipairs(plugins) do
    table.insert(response, { import = plugin })
  end

  return response
end

require("core")
require("lazy").setup(register_plugins(settings.plugin_paths), {
  checker = {
    enabled = true,
    notify = false,
  },
  install = {
    missing = true,
    colorscheme = settings.colorschemes,
  },
  ui = {
    border = "rounded",
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

vim.cmd.colorscheme(settings.theme)
