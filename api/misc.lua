---Returns list of `ObjectRefs`.
---@return ObjectRef[]
function minetest.get_connected_players() end

---Returns whether `obj` is a player
---@param obj ObjectRef
---@return boolean
function minetest.is_player(obj) end

---Returns whether player exists (regardless of online status).
---@param name string
---@return boolean
function minetest.player_exists(name) end

---Replaces definition of a builtin hud element.
---@param name '"breath"'|'"health"'
---@param hud_definition hud_definition
function minetest.hud_replace_builtin(name, hud_definition) end


---This function can be overridden by mods to change the join message.
---@param player_name string
---@return string
function minetest.send_join_message(player_name) end

---This function can be overridden by mods to change the leave message.
---@param player_name string
---@param timed_out boolean
---@return string
function minetest.send_leave_message(player_name, timed_out) end

---Returns an 48-bit integer.
---
---Gives a unique hash number for a node position (16+16+16=48bit).
---@param pos Vector
---@return integer
function minetest.hash_node_position(pos) end

---Inverse transform of `minetest.hash_node_position`.
---@param hash integer
---@return Vector
function minetest.get_position_from_hash(hash) end

---Get rating of a group of an item. (`0` means: not in group)
---@param name string
---@param group string
---@return integer
function minetest.get_item_group(name, group) end

---Get rating of a group of an item. (`0` means: not in group)
---
---An alias for `minetest.get_item_group`.
---@deprecated
---@param name string
---@param group string
---@return integer
function minetest.get_node_group(name, group) end

---Returns rating of the `connect_to_raillike` group corresponding to name
---
---If name is not yet the name of a `connect_to_raillike` group, a new group id is created, with that name.
---@param name string
---@return integer
function minetest.raillike_group(name) end

---Gets the internal content ID of the node `name`.
---@param name string
---@return integer
function minetest.get_content_id(name) end

---Gets the name of the node with that content ID.
---@param content_id integer
---@return string
function minetest.get_name_from_content_id(content_id) end

---Convert a string containing JSON data into the Lua equivalent.
---
---On success returns a table, a string, a number, a boolean or `nullvalue`.
---
---On failure outputs an error message and returns `nil`.
---
---Example: `parse_json("[10, {\"a\":false}]")`, returns `{10, {a = false}}`.
---@param string string
---@param nullvalue? any Returned in place of the JSON null; defaults to `nil`
---@return table|string|number|boolean|nil
function minetest.parse_json(string, nullvalue) end


---Convert a Lua table into a JSON string.
---
---Unserializable things like functions and userdata will cause an error.
---
---**Warning**: JSON is more strict than the Lua table format.
---1. You can only use strings and positive integers of at least one as keys.
---2. You can not mix string and integer keys. This is due to the fact that JSON has two distinct array and object values.
---@param data table
---@param styled boolean Human-readable format, default: false
---@return string? output
---@return string? error
function minetest.write_json(data, styled) end

---Convert a table containing tables, strings, numbers, booleans and `nil`s into string form readable by `minetest.deserialize`.
---
---Example: `serialize({foo="bar"})`, returns `'return { ["foo"] = "bar" }'`.
---@param table table
---@return string
function minetest.serialize(table) end

---Convert a string returned by `minetest.serialize` into a table.
---
---`string` is loaded in an empty sandbox environment.
---
---Will load functions if safe is false or omitted. Although these functions cannot directly access the global environment, they could bypass this restriction with maliciously crafted Lua bytecode if mod security is disabled.
---
---This function should not be used on untrusted data, regardless of the value of `safe`. It is fine to serialize then deserialize user-provided data, but directly providing user input to deserialize is always unsafe.
---@param string string
---@param safe? boolean
function minetest.deserialize(string, safe) end

---Compress a string of data.
---@param data string
---@param method '"deflate"' Compression method
---@param ... integer Compression level (0-9)
---@return string
function minetest.compress(data, method, ...) end

---See documentation of `minetest.compress()`.
---@param compressed_data string
---@param method '"deflate"' Compression method
---@param ... unknown
function minetest.decompress(compressed_data, method, ...) end



