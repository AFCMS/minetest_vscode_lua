---@meta

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

---Item wielded texture.
---@type string
item_definition.wield_image = nil

---An overlay to the wielded texture which does not get colorized.
---@type string
item_definition.wield_overlay = nil

---An texture containing the palette of an item.
---
---You can set the currently used color as the `"palette_index"` field of the item stack metadata.
---
---The palette is always stretched to fit indices between `0` and `255`, to ensure compatibility with `"colorfacedir"` and `"colorwallmounted"` nodes.
---@type string
item_definition.palette = nil

---The color of the item. The palette overrides this.
---@type ColorString
item_definition.color = nil

---The scale the item will have in the player hand.
---@type Vector
item_definition.wield_scale = nil

---How much items can be stacked together.
---
---The default value of `99` may be configured by users using the setting `"default_stack_max"`.
---@type integer
item_definition.stack_max = nil

---How far will the player be able to aim with this node as hand.
---@type number
item_definition.range = nil

---If true, item points to all liquid nodes (`liquidtype ~= "none"`), even those for which `pointable = false`.
---@type boolean
item_definition.liquids_pointable = nil

---* When used for nodes: Defines amount of light emitted by node.
---* Otherwise: Defines texture glow when viewed as a dropped item
---
---To set the maximum (`14`), use the value `minetest.LIGHT_MAX`.
---
---A value outside the range `0` to `minetest.LIGHT_MAX` causes undefined behavior.
---
---Default: `0`
---@type integer
item_definition.light_source = nil

---Define the tool capabilities.
---@type tool_capabilities
item_definition.tool_capabilities = nil

---Define client-side placement prediction.
---
---* If `nil` and item is node, prediction is made automatically.
---* If `nil` and item is not a node, no prediction is made.
---* If `""` and item is anything, no prediction is made.
---
---Otherwise should be name of node which the client immediately places on ground when the player places the item.
---
---Server will always update actual result shortly.
---@type string
item_definition.node_placement_prediction = nil

---Define client-side dig prediction.
---
---* If `""`, no prediction is made.
---* If `"air"`, node is removed.
---
---Otherwise should be name of node which the client immediately place upon digging.
---
---Server will always update actual result shortly.
---
---Default: `""`
---@type string
item_definition.node_dig_prediction = nil

---Definition of items sounds to be played at various events.
---
---All fields in this table are optional.
---
---* `breaks`: When tool breaks due to wear. Ignored for non-tools.
---* `eat`: When item is eaten with `minetest.do_item_eat`.
---@type {breaks: SimpleSoundSpec, eat: SimpleSoundSpec}
item_definition.sound = nil

---@type fun(itemstack: ItemStack, placer: ObjectRef, pointed_thing: pointed_thing): ItemStack?
item_definition.on_place = nil

---@type fun(itemstack: ItemStack, placer: ObjectRef, pointed_thing: pointed_thing): ItemStack?
item_definition.on_secondary_use = nil

---@type fun(itemstack: ItemStack, dropper: ObjectRef, pos: Vector): ItemStack?
item_definition.on_drop = nil

---@type fun(itemstack: ItemStack, user: ObjectRef, pointed_thing: pointed_thing)
item_definition.on_use = nil

---@type fun(itemstack: ItemStack, user: ObjectRef, node: node, digparams: table)
item_definition.after_use = nil
