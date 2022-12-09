---@meta

---Register a new node.
---@param name string
---@param def node_definition
function minetest.register_node(name, def) end

---Register a new craftitem.
---@param name string
---@param def item_definition
function minetest.register_craftitem(name, def) end

---Register a new tool.
---@param name string
---@param def item_definition
function minetest.register_tool(name, def) end

---Overrides fields of an item registered with register_node/tool/craftitem.
---
---Note: Item must already be defined, (opt)depend on the mod defining it.
---
---Example: `minetest.override_item("default:mese", {light_source=minetest.LIGHT_MAX})`
---@param name string
---@param redefinition node_definition
function minetest.override_item(name, redefinition) end

---Unregisters the item from the engine, and deletes the entry with key `name` from `minetest.registered_items` and from the associated item table according to its nature: `minetest.registered_nodes`, etc.
---@param name string
function minetest.unregister_item(name) end

---Registered nodes, indexed by name.
---@type table<string, node_definition>
minetest.registered_nodes = {}

---Registered items, indexed by name.
---@type table<string, node_definition>
minetest.registered_items = {}

---Registered tools, indexed by name.
---@type table<string, item_definition>
minetest.registered_tools = {}

---Registered craftitems, indexed by name.
---@type table<string, item_definition>
minetest.registered_craftitems = {}


---Register a new entity.
---@param name string
---@param def entity_definition
function minetest.register_entity(name, def) end

---Registered entities, indexed by name.
---@type table<string, entity_definition>
minetest.registered_entities = {}


---@class abm_definition
---Descriptive label for profiling purposes (optional).
---
---Definitions with identical labels will be listed as one.
---@field label string
---Apply `action` function to these nodes.
---
---`group:groupname` can also be used here.
---@field nodenames string[]
---Only apply `action` to nodes that have one of, or any combination of, these neighbors.
---
---If left out or empty, any neighbor will do.
---
---`group:groupname` can also be used here.
---@field neighbors string[]
---Operation interval in seconds.
---@field interval number
---Chance of triggering `action` per-node per-interval is 1.0 / this value.
---@field chance number
---Min height levels where ABM will be processed.
---
---Can be used to reduce CPU usage.
---@field min_y integer
---Max height levels where ABM will be processed.
---
---Can be used to reduce CPU usage.
---@field max_y integer
---If true, catch-up behaviour is enabled.
---
---The `chance` value is temporarily reduced when returning to an area to simulate time lost by the area being unattended.
---
---Note that the `chance` value can often be reduced to 1.
---@field catch_up boolean
---Function triggered for each qualifying node.
---* `active_object_count` is number of active objects in the node's mapblock.
---* `active_object_count_wider` is number of active objects in the node's mapblock plus all 26 neighboring mapblocks. If any neighboring mapblocks are unloaded an estimate is calculated for them based on loaded mapblocks.
---@field action fun(pos: Vector, node: node, active_object_count: integer, active_object_count_wider: integer)

---Register a new Active Block Modifier (ABM)
---@param def abm_definition
function minetest.register_abm(def) end

---@type abm_definition[]
minetest.registered_abm = {}


---@class lbm_definition
---Descriptive label for profiling purposes (optional).
---
---Definitions with identical labels will be listed as one.
---@field label string
---@field name string
---List of node names to trigger the LBM on.
---
---Also non-registered nodes will work.
---
---Groups (as of `group:groupname`) will work as well.
---@field nodenames string[]
---Whether to run the LBM's action every time a block gets activated, and not only the first time the block gets activated after the LBM was introduced.
---@field run_at_every_load boolean
---@field action fun(pos: Vector, node: node)

---Register a new Loading Block Modifier (LBM)
---
---A LBM is used to define a function that is called for specific nodes (defined by `nodenames`) when a mapblock which contains such nodes gets activated (not loaded!)
---@param def lbm_definition
function minetest.register_lbm(def) end

---@type lbm_definition[]
minetest.registered_lbm = {}


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


---Register a new ore.
---@param def ore_definition
function minetest.register_ore(def) end

---Returns an integer object handle uniquely identifying the registered biome on success.
---
---To get the biome ID, use `minetest.get_biome_id`.
---
---The maximum number of biomes that can be used is 65535.
---
---However, using an excessive number of biomes will slow down map generation.
---
---Depending on desired performance and computing power the practical limit is much lower.
---@param def biome_definition
---@return integer
function minetest.register_biome(def) end

---Map of registered biome definitions, indexed by the `name` field.
---
---If `name` is `nil`, the key is the object handle returned by `minetest.register_biome`.
---@type table<string|integer, biome_definition>
minetest.registered_biomes = {}

---Unregisters the biome from the engine, and deletes the entry with key `name` from `minetest.registered_biomes`.
---
---**Warning:** This alters the biome to biome ID correspondences, so any decorations or ores using the 'biomes' field must afterwards be cleared and re-registered.
---@param name string
function minetest.unregister_biome(name) end

---Returns an integer object handle uniquely identifying the registered decoration on success.
---
---To get the decoration ID, use `minetest.get_decoration_id`.
---
---The order of decoration registrations determines the order of decoration generation.
---@param def decoration_definition
---@return integer?
function minetest.register_decoration(def) end

---Map of registered decoration definitions, indexed by the `name` field.
---
---If `name` is nil, the key is the object handle returned by `minetest.register_decoration`.
---@type table<string|integer, decoration_definition>
minetest.registered_decorations = {}

---Returns an integer object handle uniquely identifying the registered schematic on success.
---
---If the schematic is loaded from a file, the `name` field is set to the filename.
---
---If the function is called when loading the mod, and `name` is a relative path, then the current mod path will be prepended to the schematic filename.
---@param def schematic_table
---@return integer?
function minetest.register_schematic(def) end

---Clears all biomes currently registered.
---
---**Warning:** Clearing and re-registering biomes alters the biome to biome ID correspondences, so any decorations or ores using the `biomes` field must afterwards be cleared and re-registered.
function minetest.clear_registered_biomes() end

---Clears all decorations currently registered.
function minetest.clear_registered_decorations() end

---Clears all ores currently registered.
function minetest.clear_registered_ores() end

---Clears all schematics currently registered.
function minetest.clear_registered_schematics() end

---Map of object references, indexed by active object id.
---@type table<userdata, ObjectRef>
minetest.object_refs = {}

---Map of Lua entities, indexed by active object id.
---@type table<userdata, Luaentity>
minetest.luaentities = {}
