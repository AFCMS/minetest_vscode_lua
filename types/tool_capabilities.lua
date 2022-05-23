
---Tool capabilities is a property of items that defines two things:
--1) Which nodes it can dig and how fast
--2) Which objects it can hurt by punching and by how much
---
---Tool capabilities are available for all items, not just tools.
---
---But only tools can receive wear from digging and punching.
---
---Missing or incomplete tool capabilities will default to the player's hand.
---@class tool_capabilities
local tool_capabilities = {}

---When used as a weapon, the item will do full damage if this time is spent between punches.
---
---If e.g. half the time is spent, the item will do half damage.
---@type number
tool_capabilities.full_punch_interval = nil

---Suggests the maximum level of node, when dug with the item, that will drop its useful item. (e.g. iron ore to drop a lump of iron).
---
---This is not automated; it is the responsibility of the node definition to implement this.
---@type number
tool_capabilities.max_drop_level = nil


---@type table<string, {maxlevel: integer, uses: integer, times: number[]}>
tool_capabilities.groupcaps = {}

---Damage per groups of entities. See [Entity damage mechanism].
---@type table<string, integer>
tool_capabilities.damage_groups = {}