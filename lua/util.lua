local M = {}

function M.shell(cmd)
    print(table.concat(cmd, " "))
    local output = vim.fn.system(cmd)
    assert(vim.v.shell_error == 0, "Error: " .. vim.v.shell_error .. "\n" .. output)
end

return M
