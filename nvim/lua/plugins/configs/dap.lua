local dap = require('dap')
dap.adapters.lldb = {
  type = 'executable',
  command = '/opt/homebrew/opt/llvm/bin/lldb-vscode',
  name = 'lldb'
}

dap.configurations.cpp = {
  {
    name = "Launch lldb",
    type = "lldb", -- matches the adapter
    request = "launch", -- could also attach to a currently running process
    program = function()
      return vim.fn.input(
        "Path to executable: ",
        vim.fn.getcwd() .. "/",
        "file"
      )
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    runInTerminal = false,
  },
}

-- dap.configurations.c = {
--   lldb -- different debuggers or more configurations can be used here
-- }
-- dap.configurations.cpp = {
--   lldb -- different debuggers or more configurations can be used here
-- }

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
