---@class inventory_location
local inventory_location = {}

---Define the inventory location type.
---@type '"player"'|'"node"'|'"detached"'|'"undefined"'
inventory_location.type = nil

---If inventory location is player, refers to the player name.
---
---If inventory location is detached, refers to the detached inventory name.
---@type string
inventory_location.name = nil

---If inventory location is node, refers to the node position.
---@type Vector
inventory_location.pos = nil