---Set node at position `pos`.
---@param pos Vector
---@param node node
function minetest.set_node(pos, node) end

---Set node at position `pos`.
---
---An alias for `minetest.set_node`.
---@param pos Vector
---@param node node
function minetest.add_node(pos, node) end

---Set node at all positions specified in the first argument.
---
---Faster than set_node due to single call, but still considerably slower than Lua Voxel Manipulators (LVM) for large numbers of nodes.
---
---Unlike LVMs, this will call node callbacks. It also allows setting nodes in spread out positions which would cause LVMs to waste memory.
---
---For setting a cube, this is **1.3x faster** than set_node whereas LVM is **20 times faster**.
---@param positions Vector[]
---@param node node
function minetest.bulk_set_node(positions, node) end

---Set node at position `pos`, but don't remove metadata.
---@param pos Vector
---@param node node
function minetest.swap_node(pos, node) end

---Remove node at position `pos`.
---
---By default it does the same as `minetest.set_node(pos, {name="air"})`
---@param pos Vector
function minetest.remove_node(pos) end

---Returns the node at the given position as table.
---
---Returns `{name="ignore", param1=0, param2=0}` for unloaded areas.
---@param pos Vector
---@return node
function minetest.get_node(pos) end

---Same as `minetest.get_node` but returns `nil` for unloaded areas.
---@param pos Vector
---@return node?
function minetest.get_node_or_nil(pos) end

---Gets the light value at the given position. Note that the light value "inside" the node at the given position is returned, so you usually want to get the light value of a neighbor.
---@param pos Vector
---@param timeofday? number `nil` for current time, `0` for night, `0.5` for day
---@return integer? light Between `0` and `15`, `nil` if the area isn't loaded.
function minetest.get_node_light(pos, timeofday) end

---Get the sunlight (or moonlight) value at pos at the given time of day.
---
---This function tests 203 nodes in the worst case, which happens very unlikely.
---@param pos Vector
---@param timeofday? number `nil` for current time, `0` for night, `0.5` for day
---@return integer? light Between `0` and `15`, `nil` if the area isn't loaded.
function minetest.get_natural_light(pos, timeofday) end

---Calculates the artificial light (light from e.g. torches) value from the `param1` value.
---
---Currently it's the same as `math.floor(param1 / 16)`, except that it ensures compatibility.
---@param param1 integer The param1 value of a `paramtype = "light"` node.
---@return integer light Between `0` and `15`.
function minetest.get_artificial_light(param1) end

---Place node with the same effects that a player would cause. (like calling `on_place` callbacks)
---@param pos Vector
---@param node node
function minetest.place_node(pos, node) end

---Dig node with the same effects that a player would cause.
---
---Returns `true` if successful, `false` on failure (e.g. protected location)
---@param pos Vector
---@return boolean
function minetest.dig_node(pos) end

---Punch node with the same effects that a player would cause.
---@param pos Vector
function minetest.punch_node(pos) end

---Change node into falling node
---
---Returns `true` and the ObjectRef of the spawned entity if successful, `false` on failure
---@param pos Vector
---@return boolean
---@return ObjectRef?
function minetest.spawn_falling_node(pos) end

---Get a table of positions of nodes that have metadata within a region `{pos1, pos2}`.
---@param pos1 Vector
---@param pos2 Vector
---@return Vector[]
function minetest.find_nodes_with_meta(pos1, pos2) end

---Get a `NodeMetaRef` at that position.
---@param pos Vector
---@return NodeMetaRef
function minetest.get_meta(pos) end

---Get a `NodeTimerRef` at that position.
---@param pos Vector
---@return NodeTimerRef
function minetest.get_node_timer(pos) end

--FIXME: staticdata

---Spawn a Lua-defined entity at position `pos`.
---
---Returns `ObjectRef`, or `nil` if failed
---@param pos Vector
---@param name string
---@param staticdata? table
---@return ObjectRef?
function minetest.add_entity(pos, name, staticdata) end

---Spawn an item at position `pos`
---
---Returns `ObjectRef`, or `nil` if failed
---@param pos Vector
---@param item ItemStack
---@return ObjectRef?
function minetest.add_item(pos, item) end

---Get `ObjectRef` of player with name `name` or `nil` if player is not connected.
---@param name string
---@return ObjectRef?
function minetest.get_player_by_name(name) end

---Returns a list of ObjectRefs.
---@param pos Vector
---@param radius number using an euclidean metric
---@return ObjectRef[]
function minetest.get_objects_inside_radius(pos, radius) end

---Returns a list of ObjectRefs.
---
---`pos1` and `pos2` are the min and max positions of the area to search.
---@param pos1 Vector
---@param pos2 Vector
---@return ObjectRef[]
function minetest.get_objects_in_area(pos1, pos2) end

---Set time of day in the minetest world.
---@param val number between `0` and `1`; `0` for midnight, `0.5` for midday
function minetest.set_timeofday(val) end

---Get time of day in the minetest world.
---@return number
function minetest.get_timeofday() end

---Returns the time, in seconds, since the world was created.
---@return integer
function minetest.get_gametime() end

---Returns number days elapsed since world was created.
---
---Accounts for time changes.
---@return integer
function minetest.get_day_count() end

---Find a node near specified position.
---@param pos Vector
---@param radius number using a maximum metric
---@param nodenames string|string[] e.g. `{"ignore", "group:tree"}` or `"default:dirt"`
---@param search_center? boolean is an optional boolean (default: `false`). if true `pos` is also checked for the nodes
---@return Vector?
function minetest.find_node_near(pos, radius, nodenames, search_center) end

---Find nodes in specified area.
---
---Area volume is limited to 4,096,000 nodes.
---
---* If `grouped` is `true` the return value is a table indexed by node name which contains lists of positions.
---* If `grouped` is `false` or absent the return values are as follows:
---  * **first value:** Table with all node positions
---  * **second value:** Table with the count of each node with the node name as index
---@param pos1 Vector
---@param pos2 Vector
---@param nodenames string|string[] e.g. `{"ignore", "group:tree"}` or `"default:dirt"`
---@param grouped? boolean default `false`
---@return Vector[]|table<string, Vector[]>
---@return table<string, integer>?
function minetest.find_nodes_in_area(pos1, pos2, nodenames, grouped) end

---Find nodes under air in specified area.
---
---Area volume is limited to 4,096,000 nodes.
---@param pos1 Vector
---@param pos2 Vector
---@param nodenames string|string[] e.g. `{"ignore", "group:tree"}` or `"default:dirt"`
---@return Vector[]
function minetest.find_nodes_in_area_under_air(pos1, pos2, nodenames) end

---Return world-specific perlin noise.
---
---The actual seed used is the noiseparams seed plus the world seed.
---@param noiseparams noise_params
function minetest.get_perlin(noiseparams) end

---Return voxel manipulator object.
---
---Loads the manipulator from the map if positions are passed.
---@param pos1? Vector
---@param pos2? Vector
---@return VoxelManip
function minetest.get_voxel_manip(pos1, pos2) end

---Clear all objects in the environment.
---
---Takes an optional table as an argument with the field `mode`.
---* mode = `"full"` : Load and go through every mapblock, clearing objects (default).
---* mode = `"quick"`: Clear objects immediately in loaded mapblocks, clear objects in unloaded mapblocks only when the mapblocks are next activated.
---@param options {mode: '"full"'|'"quick"'}
function minetest.clear_objects(options) end
