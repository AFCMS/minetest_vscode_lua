---@class PlayerHPChangeReason
local player_hp_change = {}

---Type of the change:
---* `set_hp`: A mod or the engine called `set_hp` without giving a type - use this for custom damage types.
---* `punch`: Was punched. `reason.object` will hold the puncher, or nil if none.
---* `fall`
---* `node_damage`: `damage_per_second` from a neighbouring node. `reason.node` will hold the node name or nil.
---* `drown`
---* `respawn`
---@type '"set_hp"'|'"punch"'|'"fall"'|'"node_damage"'|'"drown"'|'"respawn"'
player_hp_change.type = nil

---The hp change origin.
---@type '"mod"'|'"engine"'
player_hp_change.from = nil

---**Damage type: punch**
---
---The puncher object or `nil` if there is none.
---@type ObjectRef?
player_hp_change.object = nil

---**Damage type: node_damage**
---
---The name of the damaging node
---@type string?
player_hp_change.node = nil