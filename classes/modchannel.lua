---@class ModChannel
local ModChannel = {}

---Leave the mod channel.
---
---No more incoming or outgoing messages can be sent to this channel from server mods.
---
---This invalidate all future object usage.
---
---Ensure you set mod_channel to nil after that to free Lua resources.
function ModChannel:leave() end

---Returns true if channel is writeable and mod can send over it.
---@return boolean
function ModChannel:is_writable() end

---If mod channel is not writeable or invalid, message will be dropped.
---
---Message size is limited to 65535 characters by protocol.
---@param message string
function ModChannel:send_all(message) end