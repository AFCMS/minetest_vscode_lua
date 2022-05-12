--FIXME: return value (iterator)

---Create a Raycast
---@param pos1 Vector Start of the ray
---@param pos2 Vector End of the ray
---@param objects boolean If `false`, only nodes will be returned. Default is `true`.
---@param liquids boolean If `false`, liquid nodes (`liquidtype ~= "none"`) won't be returned. Default is `false`.
function Raycast(pos1, pos2, objects, liquids) end

minetest.raycast = Raycast

---@class pointed_thing_raycast: pointed_thing
---@field intersection_point Vector
---@field box_id integer
---@field intersection_normal Vector

---@class Raycast
local raycast = {}

---Returns a `pointed_thing` with exact pointing location.
---
---Returns the next thing pointed by the ray or nil.
---@return pointed_thing_raycast?
function raycast:next() end