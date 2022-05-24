---Register a function that will be called every server step, usually interval of 0.1s
---@param func fun(dtime: number)
function minetest.register_globalstep(func) end

---Map of registered globalsteps.
---@type fun(dtime: number)[]
minetest.registered_globalstep = {}


---Register a function that will be called after mods have finished loading and before the media is cached or the aliases handled.
---@param func fun()
function minetest.register_on_mods_loaded(func) end

---Map of registered on_mods_loaded.
---@type fun()[]
minetest.registered_on_mods_loaded = {}


---Register a function that will be called before server shutdown.
---
---**Warning**: If the server terminates abnormally (i.e. crashes), the registered callbacks **will likely not be run**.
---
---Data should be saved at semi-frequent intervals as well as on server shutdown.
---@param func fun()
function minetest.register_on_shutdown(func) end

---Map of registered on_shutdown.
---@type fun()[]
minetest.registered_on_shutdown = {}


---Register a function that will be called when a node has been placed.
---
---If return `true` no item is taken from `itemstack`
---
---**Not recommended**: use `on_construct` or `after_place_node` in node definition then possible.
---@param func fun(pos: Vector, newnode: string, placer?: ObjectRef, oldnode: string, itemstack: ItemStack, pointed_thing: pointed_thing): boolean
function minetest.register_on_placenode(func) end

---Map of registered on_placenode.
---@type fun(pos: Vector, newnode: string, placer?: ObjectRef, oldnode: string, itemstack: ItemStack, pointed_thing: pointed_thing)[]
minetest.registered_on_placenode = {}