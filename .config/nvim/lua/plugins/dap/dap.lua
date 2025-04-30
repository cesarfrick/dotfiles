return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dap_utils = require("dap.utils")
    local dapui = require("dapui")
    local map = vim.keymap.set

    -- require("telescope").load_extension("dap")

    dapui.setup()

    -- dap.configurations.javascript = {
    --   {
    --     type = "pwa-node",
    --     request = "attach",
    --     name = "Attach to existing Node process",
    --     processId = dap_utils.pick_process,
    --     port = 9229,
    --     sourceMaps = true,
    --     resolveSourceMapLocations = {
    --       "${workspaceFolder}/**",
    --       "!**/node_modules/**",
    --     },
    --     skipFiles = {
    --       "${workspaceFolder}/node_modules/**/*.js",
    --     },
    --   },
    --   {
    --     type = "pwa-node",
    --     request = "launch",
    --     name = "Launch current file in new Node process",
    --     program = "${file}",
    --   },
    --   {
    --     type = "pwa-chrome",
    --     request = "launch",
    --     name = "Launch Chrome Browser",
    --     url = "http://localhost:8080",
    --     webRoot = "${workspaceFolder}",
    --     protocol = 9222,
    --     skipFiles = { "**/node_modules/**/*", "dist/**/*" },
    --   },
    -- }

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

    map("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
    map("n", "<leader>dc", dap.continue, { desc = "Continue" })
    map("n", "<leader>di", dap.step_into, { desc = "Step into" })
    map("n", "<leader>do", dap.step_over, { desc = "Step over" })
    map("n", "<leader>dO", dap.step_out, { desc = "Step out" })
    map("n", "<leader>dC", dap.close, { desc = "Close" })
    map("n", "<leader>dt", dap.terminate, { desc = "Terminate session" })
  end,
}
