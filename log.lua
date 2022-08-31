---@meta

---@alias log_level '"none"'|'"error"'|'"warning"'|'"action"'|'"info"'|'"verbose"'

---Log a message.
---@overload fun(message: string)
---@param level log_level Default: `none`
---@param message string
function minetest.log(level, message) end

---Equivalent to `minetest.log(table.concat({...}, "\t"))`
---@vararg string
function minetest.debug(...) end
