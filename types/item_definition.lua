---@class item_definition
local item_definition = {}

---Item's description.
---
---Can contain new lines. `"\n"` has to be used as new line character.
---@type string
item_definition.description = nil

---Short item description.
---
---Must not contain new lines.
---
---Default: `nil`
---
---See `ItemStack:get_short_description()`
---@type string
item_definition.short_description = nil

---Item groups.
---
---key = name, value = rating; rating = 1..3.
---
---If rating not applicable, use 1.
---* `{wool = 1, fluffy = 3}`
---* `{soil = 2, outerspace = 1, crumbly = 1}`
---* `{bendy = 2, snappy = 1}`
---* `{hard = 1, metal = 1, spikes = 1}`
---@type table<string, integer>
item_definition.groups = nil

---Item inventory texture.
---@type string
item_definition.inventory_image = nil

---An overlay to the inventory texture which does not get colorized.
---@type string
item_definition.inventory_overlay = nil

item_definition.wield_image = nil
item_definition.wield_overlay = nil
item_definition.palette = nil
item_definition.color = nil
---@type Vector
item_definition.wield_scale = nil
---@type integer
item_definition.stack_max = nil
item_definition.range = nil
item_definition.liquids_pointable = nil
item_definition.light_source = nil
---@type tool_capabilities
item_definition.tool_capabilities = nil
item_definition.node_placement_prediction = nil
item_definition.node_dig_prediction = nil
item_definition.sound = nil
item_definition.on_place = nil
item_definition.on_secondary_use = nil
item_definition.on_drop = nil
item_definition.on_use = nil
item_definition.after_use = nil