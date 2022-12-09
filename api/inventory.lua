---@meta

---Get an inventory.
---@param location {type: '"player"'|'"node"'|'"detached"', name: string, node: Vector}
---@return InvRef?
---@nodiscard
function minetest.get_inventory(location) end

---@class detached_inventory_callbacks
---Called when a player wants to move items inside the inventory.
---
---Return value: number of items allowed to move.
---@field allow_move fun(inv: InvRef, from_list: string, from_index: integer, to_list: string, to_index: integer, count: integer, player: ObjectRef): integer
---Called when a player wants to put something into the inventory.
---
---Return value: number of items allowed to put.
---
---Return value -1: Allow and don't modify item count in inventory.
---@field allow_put fun(inv: InvRef, listname: string, index: integer, stack: ItemStack, player: ObjectRef): integer
---Called when a player wants to take something out of the inventory.
---
---Return value: number of items allowed to take.
---
---Return value -1: Allow and don't modify item count in inventory.
---@field allow_take fun(inv: InvRef, listname: string, index: integer, stack: ItemStack, player: ObjectRef): integer
---@field on_move fun(inv: InvRef, from_list: string, from_index: integer, to_list: string, to_index: integer, count: integer, player: ObjectRef)
---@field on_put fun(inv: InvRef, listname: string, index: integer, stack: ItemStack, player: ObjectRef)
---@field on_take fun(inv: InvRef, listname: string, index: integer, stack: ItemStack, player: ObjectRef)


---Create a detached inventory.
---@param name string
---@param callbacks detached_inventory_callbacks
---@param player_name? string Make detached inventory available to one player exclusively, by default they will be sent to every player (even if not used). Note that this parameter is mostly just a workaround and will be removed in future releases.
---@return InvRef
function minetest.create_detached_inventory(name, callbacks, player_name) end

---Remove a detached inventory.
---
---Returns a boolean indicating whether the removal succeeded.
---@param name string
---@return boolean
function minetest.remove_detached_inventory(name) end

---Returns leftover `ItemStack` or `nil` to indicate no inventory change.
---
---See `minetest.item_eat` and `minetest.register_on_item_eat`.
---@param hp_change integer
---@param replace_with_item ItemStack
---@param itemstack ItemStack
---@param user ObjectRef
---@param pointed_thing pointed_thing
---@return ItemStack?
function minetest.do_item_eat(hp_change, replace_with_item, itemstack, user, pointed_thing) end
