local dap = require "dap"

  dap.adapters.go = function(callback, config)
    local handle
    local pid_or_err
    local port = 38697
    handle, pid_or_err =
      vim.loop.spawn(
      "dlv",
      {
        args = {"dap", "-l", "127.0.0.1:" .. port},
        detached = true
      },
      function(code)
        handle:close()
        print("Delve exited with exit code: " .. code)
      end
    )
    -- Wait 100ms for delve to start
    vim.defer_fn(
      function()
        --dap.repl.open()
        callback({type = "server", host = "127.0.0.1", port = port})
      end,
      100)


    --callback({type = "server", host = "127.0.0.1", port = port})
  end
  -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
  dap.configurations.go = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      program = "${file}"
    }
  }
local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', '<leader>dc', '<cmd>lua require"dap".continue()<CR>', opts) 
vim.api.nvim_set_keymap('n', '<leader>dsv', '<cmd>lua require"dap".step_over()<CR>', opts) 
vim.api.nvim_set_keymap('n', '<leader>dsi', '<cmd>lua require"dap".step_into()<CR>', opts) 
vim.api.nvim_set_keymap('n', '<leader>dso', '<cmd>lua require"dap".step_out()<CR>', opts) 
vim.api.nvim_set_keymap('n', '<leader>dtb', '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts) 
vim.api.nvim_set_keymap('n', '<leader>dsbr', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts) 
vim.api.nvim_set_keymap('n', '<leader>dsbm', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>', opts) 
vim.api.nvim_set_keymap('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>', opts) 
vim.api.nvim_set_keymap('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>', opts)

-- telescope-dap
vim.api.nvim_set_keymap('n', '<leader>dcc', '<cmd>lua require"telescope".extensions.dap.commands{}<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>dco', '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>dlb', '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>dv', '<cmd>lua require"telescope".extensions.dap.variables{}<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>df', '<cmd>lua require"telescope".extensions.dap.frames{}<CR>', opts)
