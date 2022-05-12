---@class job
local job = {}

function job:cancel() end

---Call the function `func` after `time` seconds, may be fractional
---@param time number
---@param func function
---@param ... unknown Arguments that will be passed to `func`
---@return job
function minetest.after(time, func, ...) end