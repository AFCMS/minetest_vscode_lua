---@meta

---Place item as a node.
---@param itemstack ItemStack
---@param placer ObjectRef
---@param pointed_thing pointed_thing
---@param param2? integer overrides `facedir` and wallmounted `param2`
---@param prevent_after_place? boolean if `true`, `after_place_node` is not called for the newly placed node to prevent a callback and placement loop
---@return ItemStack itemstack
---@return Vector? position the location the node was placed to. `nil` if nothing was placed.
function minetest.item_place_node(itemstack, placer, pointed_thing, param2, prevent_after_place) end

---Place item as-is.
---
---Returns the leftover itemstack
---
---**Note**: This function is deprecated and will never be called.
---@param itemstack ItemStack
---@param placer ObjectRef
---@param pointed_thing pointed_thing
---@deprecated
function minetest.item_place_object(itemstack, placer, pointed_thing) end

---Wrapper that calls `minetest.item_place_node` if appropriate.
---
---Calls `on_rightclick` of `pointed_thing.under` if defined instead.
---
---**Note**: is not called when wielded item overrides `on_place`
---@param itemstack ItemStack
---@param placer ObjectRef
---@param pointed_thing pointed_thing
---@param param2? integer overrides `facedir` and wallmounted `param2`
---@return ItemStack itemstack
---@return Vector? position the location the node was placed to. `nil` if nothing was placed.
function minetest.item_place(itemstack, placer, pointed_thing, param2) end

---Drop the item.
---
---Returns the leftover itemstack.
---@param itemstack ItemStack
---@param dropper ObjectRef
---@param pos Vector
---@return ItemStack
function minetest.item_drop(itemstack, dropper, pos) end

---Returns `function(itemstack, user, pointed_thing)` as a function wrapper for `minetest.do_item_eat`.
---@param hp_change integer
---@param replace_with_item? string the itemstring which is added to the inventory. if the player is eating a stack, then `replace_with_item` goes to a different spot.
---@return fun(itemstack: ItemStack, user: ObjectRef, pos: Vector)
---@nodiscard
function minetest.item_eat(hp_change, replace_with_item) end
