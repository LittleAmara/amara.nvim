M = {}

--- Helper to easily run task asynchronously
---@param func function: task to run
M.run = function(func)
  coroutine.resume(coroutine.create(function()
    local status, err = pcall(func)
    if not status then
      vim.notify(("[async.run] unhandled error: %s"):format(tostring(err)), vim.log.levels.WARN)
    end
  end))
end

return M
