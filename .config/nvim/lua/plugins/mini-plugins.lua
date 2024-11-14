-- mini.nvim plugins
--
--TODO
return {
  { "echasnovski/mini.trailspace", event = "VeryLazy", version = "*" },
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    version = "*",
  },
  {
    "echasnovski/mini.diff",
    event = "VeryLazy",
    version = "*",
    config = function()
      require("mini.diff").setup()
    end,
  },
  { "echasnovski/mini.hipatterns", version = "*" },
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
    recommended = true,
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
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "BufReadPre",
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
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  {
    "echasnovski/mini.surround",
    dependencies = {
      "echasnovski/mini.icons",
    },
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsf",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },
  {
    "echasnovski/mini.files",
    dependencies = {
      "echasnovski/mini.icons",
      version = "*",
    },
    version = "*",
    config = function()
      local mini_files = require("mini.files")
      mini_files.setup({
        windows = {
          preview = true,
        },
      })
      local map = vim.keymap.set

      map(
        "n",
        "<leader>m",
        ":lua MiniFiles.open()<cr>",
        { desc = "Open Mini Files", noremap = true, silent = true }
      )
    end,
  },
}
