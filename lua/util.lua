local M = {}

function M.shell(cmd)
    print(table.concat(cmd, " "))
    local output = vim.fn.system(cmd)
    local msg = "Shell call failed, error: " .. vim.v.shell_error .. "\n" .. output
    assert(vim.v.shell_error == 0, msg)
end

return M
