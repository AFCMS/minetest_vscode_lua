---@meta

-----------------
-- MetaDataRef --
-----------------

---Base class used by `StorageRef`, `NodeMetaRef`, `ItemStackMetaRef`, and `PlayerMetaRef`.
---@class MetaDataRef: userdata
local MetaDataRef = {}

---Returns `true` if key present, otherwise `false`.
---
---Returns `nil` when the MetaData is inexistent.
---@param key string
---@return boolean?
---@nodiscard
function MetaDataRef:contains(key) end

---Returns `nil` if key not present, else the stored string.
---@param key string
---@return string?
---@nodiscard
function MetaDataRef:get(key) end

---Value of `""` will delete the key.
---@param key string
---@param value string
function MetaDataRef:set_string(key, value) end

---Returns `""` if key not present.
---@param key string
---@return string
---@nodiscard
function MetaDataRef:get_string(key) end

---@param key string
---@param value integer
function MetaDataRef:set_int(key, value) end

---Returns `0` if key not present.
---@param key string
---@return integer
---@nodiscard
function MetaDataRef:get_int(key) end

---@param key string
---@param value number
function MetaDataRef:set_float(key, value) end

---Returns `0` if key not present.
---@param key string
---@return number
---@nodiscard
function MetaDataRef:get_float(key) end

---Returns `nil` or a table with keys:
--- * `fields`: key-value storage
---@return {fields: {[string]: any}}?
---@nodiscard
function MetaDataRef:to_table() end

---Any non-table value will clear the metadata.
---
---Returns `true` on success.
--- * `fields`: key-value storage
---@param table {fields: {[string]: any}}?
---@return boolean
function MetaDataRef:from_table(table) end

---Returns `true` if this metadata has the same key-value pairs as `other`.
---@param other MetaDataRef
---@return boolean
---@nodiscard
function MetaDataRef:equals(other) end

-----------------
-- NodeMetaRef --
-----------------

---@class NodeMetaRef: MetaDataRef
local NodeMetaRef = {}

---Returns `nil` or a table with keys:
--- * `fields`: key-value storage
--- * `inventory`: `{list1 = {}, ...}}`
---@return {fields: {[string]: any}, inventory: {[string]: {[integer]: string}}}?
---@nodiscard
function NodeMetaRef:to_table() end

---Any non-table value will clear the metadata.
---
---Returns `true` on success.
--- * `fields`: key-value storage
--- * `inventory`: `{list1 = {}, ...}}`
---@param table {fields: {[string]: any}, inventory: {[string]: {[integer]: string}}}?
---@return boolean
function NodeMetaRef:from_table(table) end

---Returns `InvRef`
---@return InvRef
---@nodiscard
function NodeMetaRef:get_inventory() end

---Mark specific vars as private.
---
---This will prevent them from being sent to the client.
---
---Note that the "private" status will only be remembered if an associated key-value pair exists, meaning it's best to call this when initializing all other meta (e.g. `on_construct`).
---@param name string|string[]
function NodeMetaRef:mark_as_private(name) end

----------------------
-- ItemStackMetaRef --
----------------------

---@class ItemStackMetaRef: MetaDataRef
local ItemStackMetaRef = {}

---Overrides the item's tool capabilities
---
---A nil value will clear the override data and restore the original behavior.
---@param tool_capabilities tool_capabilities
function ItemStackMetaRef:set_tool_capabilities(tool_capabilities) end

----------------
-- StorageRef --
----------------

---@class StorageRef: MetaDataRef

---Returns reference to mod private `StorageRef`.
---
---Must be called during mod load time.
---@return StorageRef
---@nodiscard
function minetest.get_mod_storage() end

-------------------
-- PlayerMetaRef --
-------------------

---@class PlayerMetaRef: MetaDataRef
