---@meta

---AreaStore is a data structure to calculate intersections of 3D cuboid volumes and points.
---
---The `data` field (string) may be used to store and retrieve any mod-relevant information to the specified area.
---
---Despite its name, mods must take care of persisting AreaStore data. They may use the provided load and write functions for this.
---@class AreaStore
local area_store = {}

---Returns the area information about the specified ID.
---
---Returned values are either of these:
---* `nil`: Area not found
---* `true`: Without `include_corners` and `include_data`
---* `{min = pos, max = pos, data = string}`: `include_corners = true` and `include_data = true`
---@param id integer
---@param include_corners boolean
---@param include_data boolean
---@return nil|true|{min: Vector, max: Vector, data: string}
---@nodiscard
function area_store:get_area(id, include_corners, include_data) end

---Returns all areas as table, indexed by the area ID.
---
---Table values: see `get_area`.
---@param pos Vector
---@param include_corners boolean
---@param include_data boolean
---@return table<integer, nil|true|{min: Vector, max: Vector, data: string}>
---@nodiscard
function area_store:get_areas_for_pos(pos, include_corners, include_data) end

---Returns all areas that contain all nodes inside the area specified by`corner1 and `corner2` (inclusive).
---
---`accept_overlap`: if `true`, areas are returned that have nodes in common (intersect) with the specified area.
---
---Returns the same values as `get_areas_for_pos`.
---@param corner1 Vector
---@param corner2 Vector
---@param accept_overlap boolean
---@param include_corners boolean
---@param include_data boolean
---@return table<integer, nil|true|{min: Vector, max: Vector, data: string}>
---@nodiscard
function area_store:get_areas_in_area(corner1, corner2, accept_overlap, include_corners, include_data) end

---Returns the new area's ID, or nil if the insertion failed.
---
---The (inclusive) positions `corner1` and `corner2` describe the area.
---* `data` is a string stored with the area.
---* `id` (optional): will be used as the internal area ID if it is an unique number between 0 and 2^32-2.
---@param corner1 Vector
---@param corner2 Vector
---@param data string
---@param id? integer
function area_store:insert_area(corner1, corner2, data, id) end

---Requires SpatialIndex, no-op function otherwise.
---
---Reserves resources for `count` many contained areas to improve efficiency when working with many area entries. Additional areas can still be inserted afterwards at the usual complexity.
---@param count integer
function area_store:reserve(count) end

---Removes the area with the given id from the store, returns success.
---@param id integer
---@return boolean
function area_store:remove_area(id) end

---Sets params for the included prefiltering cache.
---
---Calling invalidates the cache, so that its elements have to be newly generated.
---* `params` is a table with the following fields:
---   * `enabled`:  Whether to enable, default true
---   * `block_radius`: The radius (in nodes) of the areas the cache generates prefiltered lists for, minimum 16, default 64
---   * `limit`: The cache size, minimum 20, default 1000
---@param params {enabled: boolean, block_radius: integer, limit: integer}
function area_store:set_cache_params(params) end

---Experimental. Returns area store serialized as a (binary) string.
---@return string
function area_store:to_string() end

---Experimental. Like `to_string()`, but writes the data to a file.
---@param filename string
function area_store:to_file(filename) end

---Experimental. Deserializes string and loads it into the `AreaStore`.
---@param str string
function area_store:from_string(str) end

---Experimental. Like `from_string()`, but reads the data from a file.
---@param filename string
function area_store:from_file(filename) end

---Returns a new AreaStore instance.
---
---@param type_name? '"LibSpatial"' Forces the internally used API
---@return AreaStore
---@nodiscard
function AreaStore(type_name) end
