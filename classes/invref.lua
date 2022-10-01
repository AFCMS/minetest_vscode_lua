---@meta

---A reference to an inventory.
---@class InvRef
local InvRef = {}

---Return `true` if list is empty.
---@param listname string
---@return boolean
function InvRef:is_empty(listname) end

---Get the size of a list.
---@param listname string
---@return integer
function InvRef:get_size(listname) end

---Set the size of a list.
---
---Returns `false` on error (e.g. invalid `listname` or `size`)
---@param listname string
---@param size integer
---@return boolean
function InvRef:set_size(listname, size) end

---Get the width of a list.
---@param listname string
---@return integer
function InvRef:get_width(listname) end

---Set width of the list; currently used for crafting.
---@param listname string
---@param width integer
function InvRef:set_width(listname, width) end

---Get a copy of stack index `i` in the list.
---@param listname string
---@param i integer
---@return ItemStack
function InvRef:get_stack(listname, i) end

---Copy `stack` to index `i` in the list.
---@param listname string
---@param i integer
---@param stack ItemStack
function InvRef:set_stack(listname, i, stack) end

---Returns a full list of `ItemStack`.
---@param listname string
---@return ItemStack[]
function InvRef:get_list(listname) end

---Set a full list of `ItemStack`.
---
---Size of the list will not change.
---@param listname string
---@param list ItemStack[]
function InvRef:set_list(listname, list) end

---Returns table mapping listnames to inventory lists.
---@return table<string, ItemStack[]>
function InvRef:get_lists() end

---Sets inventory lists (size will not change).
---@param lists table<string, ItemStack[]>
function InvRef:set_lists(lists) end

---Add `stack` somewhere in list, returns leftover `ItemStack`.
---@param listname string
---@param stack ItemStack
---@return ItemStack
function InvRef:add_item(listname, stack) end

---Returns `true` if the stack of items can be fully added to the list.
---@param listname string
---@param stack ItemStack
---@return boolean
function InvRef:room_for_item(listname, stack) end

---Returns `true` if the stack of items can be fully taken from the list.
---
---If `match_meta` is false, only the items' names are compared (default: `false`).
---@param listname string
---@param stack ItemStack
---@param match_meta? boolean
function InvRef:contains_item(listname, stack, match_meta) end

---Take as many items as specified from the list, returns the items that were actually removed (as an `ItemStack`).
---
---Note that any item metadata is ignored, so attempting to remove a specific unique item this way will likely remove the wrong one.
---
---To do that use `set_stack` with an empty `ItemStack`.
---@param listname string
---@param stack ItemStack
---@return ItemStack
function InvRef:remove_item(listname, stack) end

---Returns a location compatible with `minetest.get_inventory(location)`.
---@return inventory_location
function InvRef:get_location() end

---Get an inventory.
---@param location {type: '"player"', name: string}|{type: '""', node: Vector}|{type: '"detached"', name: string}
---@return InvRef?
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
