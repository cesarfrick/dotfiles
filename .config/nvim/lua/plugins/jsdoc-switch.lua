return {
  'joeldotdias/jsdoc-switch.nvim',
  ft = { -- Add or remove filetypes from this section depending on your requirements
    'javascript',
    'javascriptreact'
  },
  config = function()
    local map = vim.keymap.set

    local jsDoc = require('jsdoc-switch')

    jsDoc.setup({
      auto_set_keys = false,
    })
    -- map('n', '<leader>cj', '<cmd>JsdocSwitchToggle<CR>', { desc = "Toggle JSDoc Typechecking" })
    map('n', '<leader>cj', '<cmd>JsdocSwitchStart<CR>', { desc = "Start JSDoc Typechecking" })
    map('n', '<leader>cJ', '<cmd>JsdocSwitchStop<CR>', { desc = "Stop JSDoc Typechecking" })
  end
}
