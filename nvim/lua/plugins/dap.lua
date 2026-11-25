-- Debugging (nvim-dap): Python via debugpy, JS/TS/React via vscode-js-debug.
-- Adapters come from Mason (see settings.tooling); keymaps live in keymaps.lua.
local js_filetypes = {
  "javascript",
  "javascriptreact",
  "typescript",
  "typescriptreact",
}

local function setup_js(dap)
  local adapter = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = { command = "js-debug-adapter", args = { "${port}" } },
  }
  dap.adapters["pwa-node"] = adapter
  dap.adapters["pwa-chrome"] = adapter

  for _, filetype in ipairs(js_filetypes) do
    dap.configurations[filetype] = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Node: launch current file",
        program = "${file}",
        cwd = "${workspaceFolder}",
        sourceMaps = true,
        skipFiles = { "<node_internals>/**", "**/node_modules/**" },
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Node: attach to process",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
        sourceMaps = true,
        skipFiles = { "<node_internals>/**", "**/node_modules/**" },
      },
      {
        -- Start the dev server first (npm run dev); this opens Chrome on it.
        type = "pwa-chrome",
        request = "launch",
        name = "Chrome: launch dev server URL (React)",
        url = function()
          return vim.fn.input("URL: ", "http://localhost:5173")
        end,
        webRoot = "${workspaceFolder}",
        sourceMaps = true,
      },
    }
  end
end

return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "mfussenegger/nvim-dap-python",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      vim.fn.sign_define("DapBreakpoint", {
        text = "●",
        texthl = "DiagnosticError",
      })
      vim.fn.sign_define("DapBreakpointCondition", {
        text = "◆",
        texthl = "DiagnosticWarn",
      })
      vim.fn.sign_define("DapLogPoint", {
        text = "◆",
        texthl = "DiagnosticInfo",
      })
      vim.fn.sign_define("DapStopped", {
        text = "▶",
        texthl = "DiagnosticOk",
        linehl = "Visual",
      })

      dapui.setup()
      dap.listeners.after.event_initialized.dapui = dapui.open
      dap.listeners.before.event_terminated.dapui = dapui.close
      dap.listeners.before.event_exited.dapui = dapui.close

      -- Mason's debugpy-adapter runs the adapter; the debugged program uses
      -- the project's interpreter (VIRTUAL_ENV, ./.venv, ./venv, or python3).
      require("dap-python").setup("debugpy-adapter")
      setup_js(dap)
    end,
  },
}
