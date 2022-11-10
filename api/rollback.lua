---@meta

---Find who has done something to a node, or near a node.
---
---Returns `{{actor, pos, time, oldnode, newnode}, ...}`
---
---* `actor`: `"player:<name>"` or `"liquid"`.
---@param pos Vector
---@param range number
---@param seconds number
---@param limit integer
---@return {[1]: string|'"liquid"', [2]: Vector, [3]: number, [4]: node, [5]: node}[]
---@nodiscard
function minetest.rollback_get_node_actions(pos, range, seconds, limit) end

---Revert latest actions of someone.
---@param actor string|'"liquid"' `"player:<name>"` or `"liquid"`.
---@param seconds number
---@return boolean success
---@return string[] log_messages
function minetest.rollback_revert_actions_by(actor, seconds) end
