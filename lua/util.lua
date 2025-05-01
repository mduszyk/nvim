local M = {}

function M.shell(cmd)
    print(table.concat(cmd, " "))
    local output = vim.fn.system(cmd)
    assert(vim.v.shell_error == 0, "Error: " .. vim.v.shell_error .. "\n" .. output)
end

M.deagnostics_enabled = false

M.toggle_diagnostics = function ()
  if M.diagnostics_enabled then
    vim.diagnostic.enable(false)
    print("󱙎 Diagnostics disabled")
  else
    vim.diagnostic.enable(true)
    print("󰍥 Diagnostics enabled")
  end
  M.diagnostics_enabled = not M.diagnostics_enabled
end

M.toggle_copilot = function ()
  vim.g.copilot_enabled = not vim.g.copilot_enabled
  if vim.g.copilot_enabled then
    print(" Copilot enabled")
  else
    print(" Copilot disabled")
  end
end

return M
