
---Returns an `ItemStack`
---@param x ItemStack|string|table|nil
---@return ItemStack
function ItemStack(x) end

---An `ItemStack` is a stack of items.
---@class ItemStack
local stack = {}

---Returns `true` if stack is empty.
---@return boolean
function stack:is_empty() end

---Returns item name (e.g. `"default:stone"`).
---@return string
function stack:get_name() end

---Returns a boolean indicating whether the item was cleared.
---@param item_name string
---@return boolean
function stack:set_name(item_name) end

---Returns number of items in the stack.
---@return integer
function stack:get_count() end

---Returns a boolean indicating whether the item was cleared.
---@param count integer
---@return boolean
function stack:set_count(count) end


---Returns tool wear (`0`-`65535`), `0` for non-tools.
---@return integer
function stack:get_wear() end

---Returns boolean indicating whether item was cleared.
---@param wear integer
---@return integer
function stack:set_wear(wear) end

---Returns `ItemStackMetaRef`.
---@return ItemStackMetaRef
function stack:get_meta() end

---Returns the description shown in inventory list tooltips.
---
---The engine uses this when showing item descriptions in tooltips.
---
---Fields for finding the description, in order:
--- * `description` in item metadata
--- * `description` in item definition
--- * item name
---@return string
function stack:get_description() end

---Returns the short description or nil.
---
---Unlike the description, this does not include new lines.
---
---Fields for finding the short description, in order:
--- * `short_description` in item metadata
--- * first line of the description
--- * item name
---@return string?
function stack:get_short_description() end

---Removes all items from the stack, making it empty.
function stack:clear() end

---Replace the contents of the stack.
---@param item ItemStack|string|table Can be an ItemStack, an itemstring or a table.
function stack:replace(item) end

---Returns the stack in itemstring form.
---@return string
function stack:to_string() end

---Returns the stack in Lua table form.
---@return table
function stack:to_table() end

---Returns the maximum size of the stack (depends on the item).
---@return integer
function stack:get_stack_max() end

---Returns `get_stack_max() - get_count()`.
---@return integer
function stack:get_free_space() end

---Returns `true` if the item name refers to a defined item type.
---@return boolean
function stack:is_known() end

---Returns the item definition table.
---@return table
function stack:get_definition() end

---Returns the digging properties of the item, or those of the hand if none are defined for this item type.
---@return table
function stack:get_tool_capabilities() end

---Increases wear by `amount` if the item is a tool, otherwise does nothing.
---@param amount integer
function stack:add_wear(amount) end

---Put some item or stack onto this stack.
---
---Returns leftover `ItemStack`.
---@param item ItemStack|string|table
---@return ItemStack
function stack:add_item(item) end

---Returns `true` if item or stack can be fully added to this one.
---@param item ItemStack|string|table
---@return boolean
function stack:item_fits(item) end

---Take (and remove) up to `n` items from this stack.
---
---Return taken `ItemStack`.
---@param n integer
---@return ItemStack
function stack:take_item(n) end

---Copy (don't remove) up to `n` items from this stack.
---
---Returns taken `ItemStack`.
---@param n integer
---@return ItemStack
function stack:peek_item(n) end