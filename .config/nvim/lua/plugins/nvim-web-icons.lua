return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    local devicons = require("nvim-web-devicons")

    devicons.setup({
      strict = true,
      override_by_extension = {
        ["astro"] = {
          icon = "",
          color = "#EF8547",
          name = "astro",
        },
        ["jinja"] = {
          icon = "",
          color = "#8c212d",
          name = "jinja",
        },
      },
      override_by_filename = {
        [".gitignore"] = {
          icon = "",
          color = "#f1502f",
          name = "Gitignore",
        },
      },
      override_by_operating_system = {
        ["apple"] = {
          icon = "",
          color = "#A2AAAD",
          cterm_color = "248",
          name = "Apple",
        },
      },
    })
  end,
}
