
---Returns the currently loading mod's name, when loading a mod.
---@return string
function minetest.get_current_modname() end

---Returns the directory path for a mod,
---e.g. `"/home/user/.minetest/usermods/modname"`.
---* Returns nil if the mod is not enabled or does not exist (not installed).
---* Works regardless of whether the mod has been loaded yet.
---* Useful for loading additional `.lua` modules or static data from a mod,
---@param modname string
---@return string
function minetest.get_modpath(modname) end

---Returns a list of enabled mods, sorted alphabetically.
---
---Does not include disabled mods, even if they are installed.
---@return string[]
function minetest.get_modnames() end

---Returns e.g. `"/home/user/.minetest/world"`
---
---Useful for storing custom data in the world directory.
---@return string
function minetest.get_worldpath() end

---Returns `true` if the game is launched as singleplayer.
---@return boolean
function minetest.is_singleplayer() end


---Table containing API feature flags.
minetest.features = {}

---**Minetest 0.4.7**
minetest.features.glasslike_framed = true

---**Minetest 0.4.7**
minetest.features.nodebox_as_selectionbox = true

---**Minetest 0.4.7**
minetest.features.get_all_craft_recipes_works = true

---The transparency channel of textures can optionally be used on nodes.
---
---**Minetest 0.4.7**
minetest.features.use_texture_alpha = true

---Tree and grass ABMs are no longer done from C++.
---
---**Minetest 0.4.8**
minetest.features.no_legacy_abms = true

---Texture grouping is possible using parentheses.
---
---**Minetest 0.4.11**
minetest.features.texture_names_parens = true

---Unique Area ID for AreaStore:insert_area.
---
---**Minetest 0.4.14**
minetest.features.area_store_custom_ids = true

---`add_entity` supports passing initial staticdata to `on_activate`
---
---**Minetest 0.4.16**
minetest.features.add_entity_with_staticdata = true

---Chat messages are no longer predicted.
---
---**Minetest 0.4.16**
minetest.features.no_chat_message_prediction = true

---The transparency channel of textures can optionally be used on objects (ie: players and lua entities)
---
---**Minetest 5.0.0**
minetest.features.object_use_texture_alpha = true

---Object selectionbox is settable independently from collisionbox.
---
---**Minetest 5.0.0**
minetest.features.object_independent_selectionbox = true

---Specifies whether binary data can be uploaded or downloaded using the HTTP API.
---
---**Minetest 5.1.0**
minetest.features.httpfetch_binary_data = true

---Whether `formspec_version[<version>]` may be used.
---
---**Minetest 5.1.0**
minetest.features.formspec_version_element = true

---Whether AreaStore's IDs are kept on save/load.
---
---**Minetest 5.1.0**
minetest.features.area_store_persistent_ids = true

---Whether minetest.find_path is functional.
---
---**Minetest 5.2.0**
minetest.features.pathfinder_works = true

---Whether Collision info is available to an objects' on_step.
---
---**Minetest 5.3.0**
minetest.features.object_step_has_moveresult = true

---Whether `get_velocity()` and `add_velocity()` can be used on players.
---
---**Minetest 5.4.0**
minetest.features.direct_velocity_on_players = true

---Nodedef's `use_texture_alpha` accepts new string modes.
---
---**Minetest 5.4.0**
minetest.features.use_texture_alpha_string_modes = true

---Degrotate `param2` rotates in units of 1.5° instead of 2° thus changing the range of values from 0-179 to 0-240.
---
---**Minetest 5.5.0**
minetest.features.degrotate_240_steps = true

---ABM supports `min_y` and `max_y` fields in definition.
---
---**Minetest 5.5.0**
minetest.features.abm_min_max_y = true

---`dynamic_add_media` supports passing a table with options.
---
---**Minetest 5.5.0**
minetest.features.dynamic_add_media_table = true

---Allows `get_sky` to return a table instead of separate values.
---
---**Minetest 5.6.0**
minetest.features.get_sky_as_table = true


---Returns `boolean`, `missing_features`
---@param arg string|table<string, boolean>
---@return boolean
---@return table<string, boolean>
function minetest.has_feature(arg) end


---@class player_informations
local player_informations = {}

---IP address of the client.
---@type string
player_informations.address = nil

---IPv4 / IPv6
---@type 4|6
player_informations.ip_version = nil

---Seconds since the client connected.
---@type integer
player_informations.connection_uptime = nil

---Protocol version used by the client.
---@type integer
player_informations.protocol_version = nil

---Formspec version supported by the client.
---@type integer
player_informations.formspec_version = nil

---Language code used by the client for translation.
---@type lang_code
player_informations.lang_code = nil

---Minimum round trip time.
---
---**Can be missing if no stats have been collected yet.**
---@type number
player_informations.min_rtt = nil

---Maximum round trip time.
---
---**Can be missing if no stats have been collected yet.**
---@type number
player_informations.max_rtt = nil

---Average round trip time.
---
---**Can be missing if no stats have been collected yet.**
---@type number
player_informations.avg_rtt = nil

---Minimum packet time jitter.
---
---**Can be missing if no stats have been collected yet.**
---@type number
player_informations.min_jitter = nil

---Maximum packet time jitter.
---
---**Can be missing if no stats have been collected yet.**
---@type number
player_informations.max_jitter = nil

---Average packet time jitter.
---
---**Can be missing if no stats have been collected yet.**
---@type number
player_informations.avg_jitter = nil

---Serialization version used by client.
---
---**DEBUG BUILD ONLY**
---@type integer
player_informations.ser_vers = nil

---Major version number.
---
---**DEBUG BUILD ONLY**
---@type integer
player_informations.major = nil

---Minor version number.
---
---**DEBUG BUILD ONLY**
---@type integer
player_informations.minor = nil

---Patch version number.
---
---**DEBUG BUILD ONLY**
---@type integer
player_informations.patch = nil

---Full version string.
---
---**DEBUG BUILD ONLY**
---@type string
player_informations.vers_string = nil

--FIXME: all possible states

---Current client state.
---
---**DEBUG BUILD ONLY**
---@type string
player_informations.state = nil


---Returns a table containing informations about a player.
---@param player_name string
---@return player_informations
function minetest.get_player_information(player_name) end

---Creates a directory specified by `path`, creating parent directories if they don't exist.
---
---Returns `true` on success.
---@param path string
---@return boolean
function minetest.mkdir(path) end

---Removes a directory specified by `path`.
---
---If `recursive` is set to `true`, the directory is recursively removed.
---
---Otherwise, the directory will only be removed if it is empty.
---
---Returns `true` on success.
---@param path string
---@param recursive boolean
---@return boolean
function minetest.rmdir(path, recursive) end

---Copies a directory specified by `source` to `destination`.
---
---Any files in `destination` will be overwritten if they already exist.
---
---Returns `true` on success.
---@param source string
---@param destination string
---@return boolean
function minetest.cpdir(source, destination) end

---Moves a directory specified by `source` to `destination`.
---
---If the `destination` is a non-empty directory, then the move will fail.
---
---Returns true on success, false on failure.
---@param source string
---@param destination string
function minetest.mvdir(source, destination) end

---Returns the list of entry names in `path`.
---
---`is_dir` is one of:
---* `nil`: return all entries
---* `true`: return only subdirectory names
---* `false`: return only file names
---@param path string
---@param is_dir? boolean
function minetest.get_dir_list(path, is_dir) end

---Replaces contents of file at path with new contents in a safe (atomic) way.
---
---Use this instead of below code when writing e.g. database files:
---```lua
---local f = io.open(path, "wb"); f:write(content); f:close()
---```
---@param path string
---@param content string
function minetest.safe_file_write(path, content) end


---Use this for informational purposes only.
---
---The information in the returned table does not represent the capabilities of the engine, nor is it reliable or verifiable.
---
---Compatible forks will have an entirely different name and version.
---@class engine_version
local engine_version = {}

---Name of the project, eg, `"Minetest"`.
---@type string
engine_version.project = nil

---Simple version, eg, `"1.2.3-dev"`.
---@type string
engine_version.string = nil

---Full git version (only set if available), eg, `"1.2.3-dev-01234567-dirty"`.
---@type string
engine_version.hash = nil

---Returns a table containing components of the engine version.
---@return engine_version
function minetest.get_version() end

---Returns the `sha1` hash of `data`.
---@param data string
---@param raw? boolean Default: `false`
---@return string
function minetest.sha1(data, raw) end

---Encode a PNG image and return it in string form.
---
---The data is one-dimensional, starting in the upper left corner of the image and laid out in scanlines going from left to right, then top to bottom.
---
---Please note that it's not safe to use `string.char` to generate raw data, use `colorspec_to_bytes` to generate raw RGBA values in a predictable way.
---
---The resulting PNG image is always 32-bit. Palettes are not supported at the moment.
---
---You may use this to procedurally generate textures during server init.
---@param width integer Width of the image
---@param height integer Height of the image
---@param data table Image data, one of:
---* array table of `ColorSpec`, length must be `width*height`
---* string with raw RGBA pixels, length must be `width*height*4`
---@param compression 0|1|2|3|4|5|6|7|8|9
---@return string
function minetest.encode_png(width, height, data, compression) end