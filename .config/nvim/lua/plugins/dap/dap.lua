return {
  "mfussenegger/nvim-dap",
  lazy = true,
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
    "nvim-neotest/nvim-nio",
    -- "leoluz/nvim-dap-go",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    -- local map_opts = { noremap = true, silent = true }
    local map = vim.keymap.set

    -- local map_table = function(initial_table, key, value)
    --   local result = initial_table
    --   result[key] = value
    --
    --   print(result)
    --
    --   return result
    -- end

    require("telescope").load_extension("dap")
    -- require("dap-go").setup()

    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end

    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end

    dap.listeners.after.event_terminated.dapui_config = function()
      dapui.close()
    end

    dap.listeners.after.event_exited.dapui_config = function()
      dapui.close()
    end

    map(
      "n",
      "<leader>db",
      "<cmd>DapToggleBreakpoint<CR>",
      { noremap = true, silent = true, desc = "Toggle breakpoint" }
    )
    map("n", "<leader>dc", "<cmd>DapContinue<CR>", { noremap = true, silent = true, desc = "Continue" })
    map("n", "<leader>di", "<cmd>DapStepInto<CR>", { noremap = true, silent = true, desc = "Step into" })
    map("n", "<leader>do", "<cmd>DapStepOver<CR>", { noremap = true, silent = true, desc = "Step over" })
    map("n", "<leader>dO", "<cmd>DapStepOut<CR>", { noremap = true, silent = true, desc = "Step out" })
    map("n", "<leader>dC", "<cmd>DapClose<CR>", { noremap = true, silent = true, desc = "Close" })
    map("n", "<leader>dt", "<cmd>DapTerminate<CR>", { noremap = true, silent = true, desc = "Terminate session" })
  end,
}
