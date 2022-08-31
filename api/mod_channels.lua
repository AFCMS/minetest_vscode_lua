---@meta

---Server joins channel `channel_name`, and creates it if necessary.
---
--You should listen for incoming messages with `minetest.register_on_modchannel_message`.
---@param channel_name string
---@return ModChannel
function minetest.mod_channel_join(channel_name) end
