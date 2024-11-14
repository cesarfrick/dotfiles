return {
  "MeanderingProgrammer/markdown.nvim",
  lazy = true,
  ft = { "markdown", "vimwiki" },
  name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  config = function()
    local map = vim.keymap.set
    require("render-markdown").setup({})

    vim.treesitter.language.register("markdown", "vimwiki")

    map("n", "<leader>mp", "<cmd>RenderMarkdown toggle<CR>", { desc = "Toggle markdown preview" })
  end,
}
