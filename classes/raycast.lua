---@meta

--FIXME: return value (iterator)

---Create a Raycast
---@param pos1 Vector Start of the ray
---@param pos2 Vector End of the ray
---@param objects? boolean If `false`, only nodes will be returned. Default is `true`.
---@param liquids? boolean If `false`, liquid nodes (`liquidtype ~= "none"`) won't be returned. Default is `false`.
---@return Raycast
---@nodiscard
function Raycast(pos1, pos2, objects, liquids) end

minetest.raycast = Raycast

---@class pointed_thing_raycast: pointed_thing
---The absolute world coordinates of the point on the selection box which is pointed at.
---
---May be in the selection box if the pointer is in the box too.
---@field intersection_point Vector
---The ID of the pointed selection box (counting starts from 1).
---@field box_id integer
---Unit vector, points outwards of the selected selection box.
---
---This specifies which face is pointed at.
---
---Is a null vector `vector.zero()` when the pointer is inside the selection box.
---@field intersection_normal Vector

---@class Raycast: userdata
local raycast = {}

---Returns a `pointed_thing` with exact pointing location.
---
---Returns the next thing pointed by the ray or nil.
---@return pointed_thing_raycast?
---@nodiscard
function raycast:next() end
