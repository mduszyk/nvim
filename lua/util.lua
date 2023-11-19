local M = {}

function M.shell_call(args)
    local output = vim.fn.system(args)
    local msg = "Shell call failed, error: " .. vim.v.shell_error .. "\n" .. output
    assert(vim.v.shell_error == 0, msg)
end

return M
