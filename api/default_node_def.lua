---@meta

---Calls functions registered by `minetest.register_on_punchnode()`.
---@param pos Vector
---@param node node
---@param puncher ObjectRef
---@param pointed_thing pointed_thing
function minetest.node_punch(pos, node, puncher, pointed_thing) end

---Checks if node can be dug, puts item into inventory, removes node.
---
---Calls functions registered by `minetest.registered_on_dignodes()`.
---@param pos Vector
---@param node node
---@param digger ObjectRef
function minetest.node_dig(pos, node, digger) end
