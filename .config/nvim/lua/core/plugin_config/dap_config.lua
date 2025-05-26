require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

vim.keymap.set("n", "<Leader>dt", ':DapToggleBreakpoint<CR>')
vim.keymap.set("n", "<Leader>dx", ':DapTerminate<CR>')
vim.keymap.set("n", "<Leader>do", ':DapStepOver<CR>')
--vim.keymap('n', '<F5>', '<Cmd>lua require("dap").continue()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<F10>', '<Cmd>lua require("dap").step_over()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<F11>', '<Cmd>lua require("dap").step_into()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<F12>', '<Cmd>lua require("dap").step_out()<CR>', { noremap = true, silent = true })

dap.adapters.python = {
    type = 'executable';
    command = 'python';
    args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
    {
        type = 'python';
        request = 'launch';
        name = "Launch file";
        program = "${file}"; -- Esto es para depurar el archivo actual
        pythonPath = function()
            return 'python' -- Ajusta según tu instalación de Python
        end;
    },
}
