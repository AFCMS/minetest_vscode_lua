---@meta

---Returns a string for making an image of a cube (useful as an item image).
---@param img1 string
---@param img2 string
---@param img3 string
---@return string
---@nodiscard
function minetest.inventorycube(img1, img2, img3) end

---Returns the position of a `pointed_thing` or `nil` if the `pointed_thing` does not refer to a node or entity.
---
---If the optional `above` parameter is true and the `pointed_thing` refers to a node, then it will return the `above` position of the `pointed_thing`.
---@param pointed_thing pointed_thing
---@param above boolean
---@return Vector?
---@nodiscard
function minetest.get_pointed_thing_position(pointed_thing, above) end

---Convert a vector to a facedir value, used in `param2` for `paramtype2="facedir"`.
---
---Passing `true` for the optional second parameter causes it to take the y component into account.
---@param dir Vector
---@param is6d? boolean
---@return integer
---@nodiscard
function minetest.dir_to_facedir(dir, is6d) end

---Convert a facedir back into a vector aimed directly out the "back" of a node.
---@param facedir integer
---@return Vector
---@nodiscard
function minetest.facedir_to_dir(facedir) end

---Convert a vector to a wallmounted value, used for `paramtype2="wallmounted"`.
---@param dir Vector
---@return integer
---@nodiscard
function minetest.dir_to_wallmounted(dir) end

---Convert a wallmounted value back into a vector aimed directly out the "back" of a node.
---@param wallmounted integer
---@return Vector
---@nodiscard
function minetest.wallmounted_to_dir(wallmounted) end

---Convert a vector into a yaw (angle).
---@param dir Vector
---@return number
---@nodiscard
function minetest.dir_to_yaw(dir) end

---Convert yaw (angle) to a vector.
---@param yaw number
---@return Vector
---@nodiscard
function minetest.yaw_to_dir(yaw) end

---Returns a boolean.
---
---Returns `true` if the given `paramtype2` contains color information (`color`, `colorwallmounted` or `colorfacedir`).
---@param ptype paramtype2
---@return boolean
---@nodiscard
function minetest.is_colored_paramtype(ptype) end

---Removes everything but the color information from the given `param2` value.
---
---Returns `nil` if the given `paramtype2` does not contain color information.
---@param param2 integer
---@param paramtype2 paramtype2
---@return integer?
function minetest.strip_param2_color(param2, paramtype2) end

---Returns list of itemstrings that are dropped by `node` when dug with the item `toolname` (not limited to tools).
---@param node node|string node as table or node name
---@param toolname? string name of the item used to dig (can be `nil`)
---@return string[]
function minetest.get_node_drops(node, toolname) end

---Get craft result.
---@param input {method: '"normal"'|'"cooking"'|'"fuel"', width: integer, items: ItemStack[]}
---@return {item: ItemStack, time: integer, replacements: ItemStack[]} output
---@return {method: '"normal"'|'"cooking"'|'"fuel"', width: integer, items: ItemStack[]} decremented_input
---@nodiscard
function minetest.get_craft_result(input) end

---Returns last registered recipe for output item (or node).
---@param output string
---@return craft_recipe
---@nodiscard
function minetest.get_craft_recipe(output) end

---Returns registered recipes for output item (or node).
---@param output string
---@return craft_recipe[]?
---@nodiscard
function minetest.get_all_craft_recipes(output) end

---Handles drops from nodes after digging: Default action is to put them into digger's inventory.
---
---Can be overridden to get different functionality (e.g. dropping items on ground)
---@param pos Vector
---@param drops string[] list of itemstrings
---@param digger ObjectRef
function minetest.handle_node_drops(pos, drops, digger) end

---Creates an item string which contains palette index information for hardware colorization.
---
---You can use the returned string as an output in a craft recipe.
---@param item string|ItemStack|table the item stack which becomes colored. can be in string, table and native form.
---@param palette_index integer this index is added to the item stack
---@return string
---@nodiscard
function minetest.itemstring_with_palette(item, palette_index) end

---Creates an item string which contains static color information for hardware colorization.
---
---Use this method if you wish to colorize an item that does not own a palette.
---
---You can use the returned string as an output in a craft recipe.
---@param item string|ItemStack|table the item stack which becomes colored. can be in string, table and native form.
---@param colorstring ColorString
---@return string
---@nodiscard
function minetest.itemstring_with_color(item, colorstring) end
