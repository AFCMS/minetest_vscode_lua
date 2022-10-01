---@meta

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

---Set the types of on-generate notifications that should be collected.
---
---`flags` is a flag field with the available flags:
---* dungeon
---* temple
---* cave_begin
---* cave_end
---* large_cave_begin
---* large_cave_end
---* decoration
---
---The second parameter is a list of IDs of decorations which notification is requested for.
---@param flags flag_specifier
---@param deco_ids unknown[]
function minetest.set_gen_notify(flags, deco_ids) end

---Returns a flagstring and a table with the `deco_id`s.
---@return string
---@return unknown[]
function minetest.get_gen_notify() end

---Returns the decoration ID number for the provided decoration name string, or `nil` on failure.
---@param decoration_name string
---@return unknown?
function minetest.get_decoration_id(decoration_name) end

---@alias mapgen_object_name
---|'"voxelmanip"' # This returns three values; the `VoxelManip` object to be used, minimum and maximum emerged position, in that order. All mapgens support this object.
---|'"heightmap"' # Returns an array containing the y coordinates of the ground levels of nodes in the most recently generated chunk by the current mapgen.
---|'"biomemap"' # Returns an array containing the biome IDs of nodes in the most recently generated chunk by the current mapgen.
---|'"heatmap"' # Returns an array containing the temperature values of nodes in the most recently generated chunk by the current mapgen.
---|'"humiditymap"' # Returns an array containing the humidity values of nodes in the most recently generated chunk by the current mapgen.
---|'"gennotify"'

---Return requested mapgen object if available.
---
---A mapgen object is a construct used in map generation.
---
---Mapgen objects can be used by an `on_generate` callback to speed up operations by avoiding unnecessary recalculations, these can be retrieved using the `minetest.get_mapgen_object()` function.
---
---If the requested Mapgen object is unavailable, or `get_mapgen_object()` was called outside of an `on_generate()` callback, `nil` is returned.
---@param objectname mapgen_object_name
function minetest.get_mapgen_object(objectname) end

---Returns the heat at the position, or `nil` on failure.
---@param pos Vector
---@return number?
function minetest.get_heat(pos) end

---Returns the humidity at the position, or `nil` on failure.
---@param pos Vector
---@return number?
function minetest.get_humidity(pos) end

---Returns a table containing:
---* `biome` the biome id of the biome at that position
---* `heat` the heat at the position
---* `humidity` the humidity at the position
---
---Returns `nil` on failure.
---@param pos Vector
---@return {biome: unknown, heat: number, humidity: number}?
---@nodiscard
function minetest.get_biome_data(pos) end

---Returns the biome id, as used in the biomemap Mapgen object and returned by `minetest.get_biome_data(pos)`, for a given biome_name string.
---@param biome_name string
---@return unknown
---@nodiscard
function minetest.get_biome_id(biome_name) end

---Returns the biome name string for the provided biome id, or `nil` on failure.
---
---If no biomes have been registered, such as in mgv6, returns `default`.
---@param biome_id unknown
---@return string|'"default"'|nil
---@nodiscard
function minetest.get_biome_name(biome_id) end

---**DEPRECATED:** use `minetest.get_mapgen_setting(name)` instead.
---
---Returns a table containing:
---* `mgname`
---* `seed`
---* `chunksize`
---* `water_level`
---* `flags`
---@deprecated
---@return {mgname: string, seed: integer, chunksize: integer, water_level: integer, flags: string}
---@nodiscard
function minetest.get_mapgen_params() end

---**DEPRECATED:** use `minetest.set_mapgen_setting(name, value, override)` instead.
---
---Set map generation parameters.
---
---Function cannot be called after the registration period; only initialization and `on_mapgen_init`.
---
---Takes a table as an argument with the fields:
---* `mgname`
---* `seed`
---* `chunksize`
---* `water_level`
---* `flags`
---
---Leave field unset to leave that parameter unchanged.
---
---`flags` contains a comma-delimited string of flags to set, or if the prefix `"no"` is attached, clears instead.
---
---`flags` is in the same format and has the same options as `mg_flags` in `minetest.conf`.
---@deprecated
---@param mapgen_params {mgname: string, seed: integer, chunksize: integer, water_level: integer, flags: string}
function minetest.set_mapgen_params(mapgen_params) end

---@alias mapgen_settings
---|'"seed"' # The seed of the Minetest world
---|'"mg_name"' # The mapgen name
---|'"mg_flags"'
---|'"water_level"' # Water height
---|'"mapgen_limit"' # Map size limit
---|'"chunksize"' # Chunk size
---|'"mgv7_spflags"'
---|'"mgv7_large_cave_num_min"'
---|'"mgv7_large_cave_num_max"'
---|'"mgv7_small_cave_num_min"'
---|'"mgv7_small_cave_num_max"'
---|'"mgv7_floatland_ymin"'
---|'"mgv7_floatland_ymax"'
---|'"mgv7_floatland_taper"'
---|'"mgv7_floatland_density"'
---|'"mgv7_floatland_ywater"'
---|'"mgv7_float_taper_exp"'
---|'"mgv7_large_cave_flooded"'
---|'"mgv7_cave_width"'
---|'"mgv7_cavern_limit"'
---|'"mgv7_cavern_threshold"'
---|'"mgv7_cavern_taper"'
---|'"mgv7_mount_zero_level"'
---|'"mgv7_dungeon_ymin"'
---|'"mgv7_dungeon_ymax"'


--TODO: Add more mapgen_settings


---Gets the *active* mapgen setting (or nil if none exists) in string format with the following order of precedence:
---
---1) Settings loaded from `map_meta.txt` or overrides set during mod execution.
---2) Settings set by mods without a metafile override
---3) Settings explicitly set in the user config file, `minetest.conf`
---4) Settings set as the user config default
---@param name mapgen_settings|string
---@return string?
---@nodiscard
function minetest.get_mapgen_setting(name) end

---Same as `minetest.get_mapgen_setting(name)`, but returns the value as a `NoiseParams` table if the setting `name` exists and is a valid `NoiseParams`.
---@return noise_params?
---@nodiscard
function minetest.get_mapgen_setting_noiseparams(name) end

---Sets a mapgen param to `value`, and will take effect if the corresponding mapgen setting is not already present in map_meta.txt.
---
---`override_meta` is an optional boolean (default: `false`). If this is set to `true`, the setting will become the active setting regardless of the map metafile contents.
---
---Note: to set the seed, use `"seed"`, not `"fixed_map_seed"`.
---@param name mapgen_settings|string
---@param value string
---@param override_meta? boolean
function minetest.set_mapgen_setting(name, value, override_meta) end

---Same as `minetest.set_mapgen_setting()`, except value is a `NoiseParams` table.
---@param name mapgen_settings|string
---@param value noise_params
---@param override_meta boolean
function minetest.set_mapgen_setting_noiseparams(name, value, override_meta) end

---Sets the noiseparams setting of `name` to the noiseparams table specified in `noiseparams`.
---
---`set_default` is an optional boolean (default: `true`) that specifies whether the setting should be applied to the default config or current active config.
---@param name string
---@param noiseparams noise_params
---@param set_default? boolean
function minetest.set_noiseparams(name, noiseparams, set_default) end

---Returns a table of the noiseparams for `name`.
---@param name string
---@return noise_params
---@nodiscard
function minetest.get_noiseparams(name) end

---Generate all registered ores within the VoxelManip `vm` and in the area from `pos1` to `pos2`.
---
---`pos1` and `pos2` are optional and default to mapchunk minp and maxp.
---@param vm VoxelManip
---@param pos1? Vector
---@param pos2? Vector
function minetest.generate_ores(vm, pos1, pos2) end

---Generate all registered decorations within the VoxelManip `vm` and in the area from `pos1` to `pos2`.
---
---`pos1` and `pos2` are optional and default to mapchunk minp and maxp.
---@param vm VoxelManip
---@param pos1? Vector
---@param pos2? Vector
function minetest.generate_decorations(vm, pos1, pos2) end

---Clear all objects in the environment.
---
---Takes an optional table as an argument with the field `mode`.
---* mode = `"full"` : Load and go through every mapblock, clearing objects (default).
---* mode = `"quick"`: Clear objects immediately in loaded mapblocks, clear objects in unloaded mapblocks only when the mapblocks are next activated.
---@param options {mode: '"full"'|'"quick"'}
function minetest.clear_objects(options) end

---Load the mapblocks containing the area from `pos1` to `pos2`.
---
---`pos2` defaults to `pos1` if not specified.
---
---This function does not trigger map generation.
---@param pos1 Vector
---@param pos2? Vector
function minetest.load_area(pos1, pos2) end

---Queue all blocks in the area from `pos1` to `pos2`, inclusive, to be asynchronously fetched from memory, loaded from disk, or if inexistent, generates them.
---
---If `callback` is a valid Lua function, this will be called for each block emerged.
---
---The function signature of callback is:
---
---`function EmergeAreaCallback(blockpos, action, calls_remaining, param)`
---* `blockpos` is the *block* coordinates of the block that had been emerged.
---* `action` could be one of the following constant values:
---   * `minetest.EMERGE_CANCELLED`
---   * `minetest.EMERGE_ERRORED`
---   * `minetest.EMERGE_FROM_MEMORY`
---   * `minetest.EMERGE_FROM_DISK`
---   * `minetest.EMERGE_GENERATED`
---* `calls_remaining` is the number of callbacks to be expected after this one.
---* `param` is the user-defined parameter passed to emerge_area (or nil if the parameter was absent).
---@param pos1 Vector
---@param pos2 Vector
---@param callback? fun(blockpos: Vector, action: 0|1|2|3|4, calls_remaining: integer, param?: any)
---@param param? any
function minetest.emerge_area(pos1, pos2, callback, param) end

---Delete all mapblocks in the area from `pos1` to `pos2`, inclusive.
---@param pos1 Vector
---@param pos2 Vector
function minetest.delete_area(pos1, pos2) end

---Checks if there is anything other than air between pos1 and pos2.
---
---Returns `false` if something is blocking the sight.
---
---Returns the position of the blocking node when `false`.
---@param pos1 Vector
---@param pos2 Vector
---@return boolean
---@return Vector?
---@nodiscard
function minetest.line_of_sight(pos1, pos2) end

---Returns table containing path that can be walked on
---
---Returns a table of 3D points representing a path from `pos1` to `pos2` or `nil` on failure.
---
---Reasons for failure:
---* No path exists at all
---* No path exists within `searchdistance` (see below)
---* Start or end pos is buried in land
---
---In detail:
---* Path must be completely inside a cuboid.
---* The minimum `searchdistance` of 1 will confine search between `pos1` and `pos2`.
---* Larger values will increase the size of this cuboid in all directions
---@param pos1 Vector start position
---@param pos2 Vector end position
---@param searchdistance number maximum distance from the search positions to search in
---@param max_jump number maximum height difference to consider walkable
---@param max_drop number maximum height difference to consider droppable
---@param algorithm '"A*_noprefetch"'|'"A*"'|'"Dijkstra"' difference between `"A*"` and `"A*_noprefetch"` is that `"A*"` will pre-calculate the cost-data, the other will calculate it on-the-fly
---@return Vector[]?
---@nodiscard
function minetest.find_path(pos1, pos2, searchdistance, max_jump, max_drop, algorithm) end

function minetest.spawn_tree(pos, treedef) end

---Add node to liquid flow update queue.
---@param pos Vector
function minetest.transforming_liquid_add(pos) end

---Get max available level for leveled node.
---@param pos Vector
---@return integer
---@nodiscard
function minetest.get_node_max_level(pos) end

---Get level of leveled node (water, snow).
---@param pos Vector
---@return integer
---@nodiscard
function minetest.get_node_level(pos) end

---Set level of leveled node, default `level` equals `1`
---
---If `totallevel > maxlevel`, returns rest (`total-max`).
---@param pos Vector
---@param level integer
---@return integer
function minetest.set_node_level(pos, level) end

---Increase level of leveled node by level, default `level` equals `1`.
---
---If `totallevel > maxlevel`, returns rest (`total-max`).
---
---`level` must be between -127 and 127
---@param pos Vector
---@param level integer
---@return integer
function minetest.add_node_level(pos, level) end

---Resets the light in a cuboid-shaped part of the map and removes lighting bugs.
---
---Loads the area if it is not loaded.
---
---* `pos1` is the corner of the cuboid with the least coordinates (in node coordinates), inclusive.
---* `pos2` is the opposite corner of the cuboid, inclusive.
---
---The actual updated cuboid might be larger than the specified one, because only whole map blocks can be updated.
---
---The actual updated area consists of those map blocks that intersect with the given cuboid.
---
---However, the neighborhood of the updated area might change as well, as light can spread out of the cuboid, also light might be removed.
---
---Returns `false` if the area is not fully generated, `true` otherwise.
---@param pos1 Vector
---@param pos2 Vector
---@return boolean
function minetest.fix_light(pos1, pos2) end

---Causes an unsupported `group:falling_node` node to fall and causes an unattached `group:attached_node` node to fall.
---
---Does not spread these updates to neighbours.
---@param pos Vector
function minetest.check_single_for_falling(pos) end

---Causes an unsupported `group:falling_node` node to fall and causes an unattached `group:attached_node` node to fall.
---
---Spread these updates to neighbours and can cause a cascade of nodes to fall.
---@param pos Vector
function minetest.check_for_falling(pos) end

---Returns a player spawn y co-ordinate for the provided (x, z) co-ordinates, or `nil` for an unsuitable spawn point.
---
---For most mapgens a 'suitable spawn point' is one with y between `water_level` and `water_level + 16`, and in mgv7 well away from rivers, so `nil` will be returned for many (x, z) co-ordinates.
---
---The spawn level returned is for a player spawn in unmodified terrain.
---
---The spawn level is intentionally above terrain level to cope with full-node biome 'dust' nodes.
---@param x integer
---@param z integer
---@return integer
---@nodiscard
function minetest.get_spawn_level(x, z) end
