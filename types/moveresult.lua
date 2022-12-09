---@class moveresult_collision
---@field type '"node"'|'"object"'
---@field axis '"x"'|'"y"'|'"z"'
---@field node_pos Vector
---@field object ObjectRef
---@field old_velocity Vector
---@field new_velocity Vector

---@class moveresult
---@field touching_ground boolean
---@field collides boolean
---@field standing_on_object boolean
---Does not contain data of unloaded mapblock collisions or when the velocity changes are negligibly small
---@field collisions moveresult_collision[]
