return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  event = "VeryLazy",
  config = function()
    local lazy_status = require("lazy.status")
    local highlight_color = "#ff9e64"
    local lualine = require("lualine")
    lualine.setup({
      options = {
        globalstatus = true,
      },
      sections = {
        lualine_a = {
          {
            "mode",
            fmt = function(res)
              local output = " " .. res
              return output
            end,
          },
        },
        lualine_c = {
          {
            "filename",
            -- path = 2,
            cond = function()
              return vim.bo.filetype ~= "alpha"
            end,
          },
          {
            "gitsigns",
          },
          {
            "nvim_treesitter",
          },
          {
            function()
              local record_id = vim.fn.reg_recording()
              if record_id ~= "" then
                return "@" .. record_id
              else
                return ""
              end
            end,
            color = { gui = "bold", fg = highlight_color },
          },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { gui = "bold", fg = highlight_color },
          },
          {
            "encoding",
            cond = function()
              local enc = (vim.bo.fenc or vim.go.enc):lower()
              return enc ~= "utf-8"
            end,
          },
          {
            "fileformat",
            cond = function()
              return vim.bo.fileformat ~= "unix"
            end,
          },
          {
            "filetype",
            cond = function()
              return vim.bo.filetype ~= "" and vim.bo.filetype ~= "alpha"
            end,
          },
        },
        -- lualine_a = { "mode" },
        -- lualine_b = { "branch", "diff", "diagnostics" },
        -- lualine_c = { "filename", "gitsigns", "nvim_treesitter" },
        -- lualine_x = { "encoding", "fileformat", "filetype" },
        -- lualine_y = { "progress" },
        -- lualine_z = { "location" },
      },
    })
  end,
}
