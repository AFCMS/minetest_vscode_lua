---@meta


---A schematic specifier identifies a schematic by either a filename to a Minetest Schematic file (`.mts`) or through raw data supplied through Lua, in the form of a table.
---@alias schematic_specifier string|integer|schematic_table

---Probability values:
---
---* A probability value of `0` or `1` means that node will never appear(0% chance).
---* A probability value of `254` or `255` means the node will always appear (100% chance).
---* If the probability value `p` is greater than `1`, then there is a `(p / 256 * 100)` percent chance that node will appear when the schematic is placed on the map.
---@class schematic_table
---A 3D vector containing the dimensions of the provided schematic.
---@field size Vector
---A slice table sets the probability of a particular horizontal slice of the schematic being placed.
---
---`ypos` = 0 for the lowest horizontal slice of a schematic.
---@field yslice_prob {ypos: Vector, prob: integer}
---The `data` field is a flat table of MapNode tables making up the schematic, in the order of `[z [y [x]]]`.
---
---Each MapNode table contains:
---* `name`: the name of the map node to place (required)
---* `prob` (alias `param1`): the probability of this node being placed (default: `255`)
---* `param2`: the raw param2 value of the node being placed onto the map (default: `0`)
---* `force_place`: boolean representing if the node should forcibly overwrite any previous contents (default: `false`)
---@field data {name: string, prob: integer, param2: integer, force_place: boolean}[]

---Create a schematic from the volume of map specified by the box formed by `p1` and `p2`.
---
---* `probability_list`: Apply the specified probability and per-node force-place to the specified nodes. An array of tables containing two fields, `pos` and `prob`.
---    * `pos` is the 3D vector specifying the absolute coordinates of the node being modified,
---    * `prob` is an integer value from `0` to `255` that encodes probability and per-node force-place. Probability has levels 0-127, then 128 may be added to encode per-node force-place. For probability stated as 0-255, divide by 2 and round down to get values 0-127, then add 128 to apply per-node force-place. If there are two or more entries with the same pos value, the last entry is used. If `pos` is not inside the box formed by `p1` and `p2`, it is ignored.
---* `slice_prob_list`: Apply the specified probability to the specified horizontal slices. An array of tables containing two fields, `ypos` and `prob`.
---    * `ypos` indicates the y position of the slice with a probability applied, the lowest slice being `ypos = 0`.
---@param p1 Vector
---@param p2 Vector
---@param probability_list? {pos: Vector, prob: integer}[]
---@param filename string # Saves schematic in the Minetest Schematic format to filename.
---@param slice_prob_list? {ypos: Vector, prob: integer}[]
function minetest.create_schematic(p1, p2, probability_list, filename, slice_prob_list) end

---Place the schematic at `pos`.
---
---Returns `nil` if the schematic could not be loaded.
---
---**Warning**: Once you have loaded a schematic from a file, it will be cached. Future calls will always use the cached version and the replacement list defined for it, regardless of whether the file or the replacement list parameter have changed. The only way to load the file anew is to restart the server.
---@param pos Vector
---@param schematic schematic_specifier
---@param rotation? '"0"'|'"90"'|'"180"'|'"270"'|'"random"'
---@param replacements? table<string, string>
---@param force_placement boolean # Boolean indicating whether nodes other than `air` and `ignore` are replaced by the schematic.
---@param flags flag_specifier # Flag field with the available flags: `place_center_x`, `place_center_y`, `place_center_z`
---@return unknown?
function minetest.place_schematic(pos, schematic, rotation, replacements, force_placement, flags) end

---This function is analogous to `minetest.place_schematic`, but places a schematic onto the specified VoxelManip object `vmanip` instead of the map.
---
---Returns `false` if any part of the schematic was cut-off due to the `VoxelManip` not containing the full area required, and true if the whole schematic was able to fit.
---
---Returns `nil` if the schematic could not be loaded.
---
---After execution, any external copies of the VoxelManip contents are invalidated.
---@param vmanip VoxelManip
---@param pos Vector
---@param schematic schematic_specifier
---@param rotation? '"0"'|'"90"'|'"180"'|'"270"'|'"random"'
---@param replacements? table<string, string>
---@param force_placement boolean # Boolean indicating whether nodes other than `air` and `ignore` are replaced by the schematic.
---@param flags flag_specifier # Flag field with the available flags: `place_center_x`, `place_center_y`, `place_center_z`
---@return boolean?
function minetest.place_schematic_on_vmanip(vmanip, pos, schematic, rotation, replacements, force_placement, flags) end

---`format`:
---* "mts": a string containing the binary MTS data used in the MTS file format.
---* "lua": a string containing Lua code representing the schematic in table format.
---
---`options`:
---* If `lua_use_comments` is true and `format` is "lua", the Lua code generated will have (X, Z) position comments for every X row generated in the schematic data for easier reading.
---* If `lua_num_indent_spaces` is a nonzero number and `format` is "lua", the Lua code generated will use that number of spaces as indentation instead of a tab character.
---@param schematic schematic_specifier
---@param format '"lua"'|'"mts"'
---@param options {lua_use_comments: boolean, lua_num_indent_spaces: integer}
---@return string
function minetest.serialize_schematic(schematic, format, options) end

---Returns a Lua table representing the schematic.
---
---`write_yslice_prob`:
---* `none`: no `write_yslice_prob` table is inserted
---* `low`: only probabilities that are not 254 or 255 are written in the `write_ylisce_prob` table
---* `all`: write all probabilities to the `write_yslice_prob` table.
---
---The default for this option is `all`.
---
---Any invalid value will be interpreted as `all`.
---@param schematic schematic_specifier
---@param options {write_yslice_prob: '"none"'|'"low"'|'"all"'}
---@return schematic_table
function minetest.read_schematic(schematic, options) end
