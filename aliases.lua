---@meta

---This adds an alias `alias` for the item called `original_name`
---@param alias string
---@param original_name string
function minetest.register_alias(alias, original_name) end

---Same as `minetest.register_alias` but will unregister the alias if it exists
---@param alias string
---@param original_name string
function minetest.register_alias_force(alias, original_name) end

---Map of registered aliases, indexed by name
---@type table<string, string>
minetest.registered_aliases = {}
