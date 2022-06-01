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
---@param func fun(pos: Vector, newnode: node, placer?: ObjectRef, oldnode: node, itemstack: ItemStack, pointed_thing: pointed_thing): boolean
function minetest.register_on_placenode(func) end

---Map of registered on_placenode.
---@type fun(pos: Vector, newnode: node, placer?: ObjectRef, oldnode: node, itemstack: ItemStack, pointed_thing: pointed_thing)[]
minetest.registered_on_placenode = {}


---Register a function that will be called when a node has been dug.
---
---**Not recommended**: use `on_destruct` or `after_dig_node` in node definition then possible.
---@param func fun(pos: Vector, oldnode: node, digger: ObjectRef)
function minetest.register_on_dignode(func) end

---Map of registered on_dignode.
---@type fun(pos: Vector, oldnode: node, digger: ObjectRef)[]
minetest.registered_on_dignode = {}


---Register a function that will be called when a node has been punched.
---@param func fun(pos: Vector, node: node, puncher: ObjectRef, pointed_thing: pointed_thing)
function minetest.register_on_punchnode(func) end

---Map of registered on_punchnode.
---@type fun(pos: Vector, node: node, puncher: ObjectRef, pointed_thing: pointed_thing)[]
minetest.registered_on_punchnode = {}


---Register a function that will be called when a piece of world has been generated.
---
---Modifying nodes inside the area is a bit faster than usually.
---@param func fun(minp: integer, maxp: integer, blockseed: integer)
function minetest.register_on_generated(func) end

---Map of registered on_generated.
---@type fun(minp: integer, maxp: integer, blockseed: integer)[]
minetest.registered_on_generated = {}


---Register a function that will be called when a player join for the first time.
---@param func fun(player: ObjectRef)
function minetest.register_on_newplayer(func) end

---Map of registered on_newplayer.
---@type fun(player: ObjectRef)[]
minetest.registered_on_newplayer = {}


---Register a function that will be called when a player is punched.
---
---Note: This callback is invoked even if the punched player is dead.
---
---Callback should return `true` to prevent the default damage mechanism.
---@param func fun(player: ObjectRef, hitter: ObjectRef, time_from_last_punch: number, tool_capabilities: tool_capabilities, dir: Vector, damage: number): boolean
function minetest.register_on_punchplayer(func) end

---Map of registered on_punchplayer.
---@type fun(player: ObjectRef, hitter: ObjectRef, time_from_last_punch: number, tool_capabilities: tool_capabilities, dir: Vector, damage: number)[]
minetest.registered_on_punchplayer = {}


---Register a function that will be called when a player is rightclicked (the `place/use` key was used while pointing a player).
---@param func fun(player: ObjectRef, clicker: ObjectRef)
function minetest.register_on_rightclickplayer(func) end

---Map of registered on_rightclickplayer.
---@type fun(player: ObjectRef, clicker: ObjectRef)[]
minetest.registered_on_rightclickplayer = {}