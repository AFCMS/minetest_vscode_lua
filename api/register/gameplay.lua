---@meta

---**Shaped**
---```lua
---{
---	output = "default:pick_stone",
---	recipe = {
---		{"default:cobble", "default:cobble", "default:cobble"},
---		{"", "default:stick", ""},
---		{"", "default:stick", ""},  -- Also groups; e.g. "group:crumbly"
---	},
---	replacements = <list of item pairs>, -- Replace one input item with another item on crafting (optional).
---}
---```
---
---**Shapeless**
---```lua
---{
---	type = "shapeless",
---	output = "mushrooms:mushroom_stew",
---	recipe = {
---		"mushrooms:bowl",
---		"mushrooms:mushroom_brown",
---		"mushrooms:mushroom_red",
---	},
---	replacements = <list of item pairs>,
---}
---```
---
---**Tool repair**
---```lua
---{
---	type = "toolrepair",
---	additional_wear = -0.02, -- Multiplier of 65536
---}
---```
---Adds a shapeless recipe for *every* tool that doesn't have the `disable_repair=1` group.
---
---Player can put 2 equal tools in the craft grid to get one "repaired" tool back.
---
---The wear of the output is determined by the wear of both tools, plus a 'repair bonus' given by `additional_wear`.
---
---To reduce the wear (i.e. 'repair'), you want `additional_wear` to be negative.
---
---The formula used to calculate the resulting wear is:
---
---	65536 - ( (65536 - tool_1_wear) + (65536 - tool_2_wear) + 65536 * additional_wear )
---
---The result is rounded and can't be lower than 0. If the result is 65536 or higher, no crafting is possible.
---
---**Cooking**
---```lua
---{
---	type = "cooking",
---	output = "default:glass",
---	recipe = "default:sand",
---	cooktime = 3,
---}
---```
---
---**Furnace fuel**
---```lua
---{
---	type = "fuel",
---	recipe = "bucket:bucket_lava",
---	burntime = 60,
---	replacements = {{"bucket:bucket_lava", "bucket:bucket_empty"}},
---}
---```
---@class craft_recipe
---@field type '"shaped"'|'"shapeless"'|'"toolrepair"'|'"cooking"'|'"fuel"'
---@field output string
---@field recipe string|string[]|string[][]
---@field replacements string[][]
---@field additional_wear number
---@field cooktime number
---@field burntime number

---Register a craft recipe
---@param recipe craft_recipe
function minetest.register_craft(recipe) end

---Will erase existing craft based either on output item or on input recipe.
---
---Specify either output or input only.
---
---If you specify both, input will be ignored.
---
---For input use the same recipe table syntax as for `minetest.register_craft(recipe)`. For output specify only the item, without a quantity.
---
---Returns `false` if no erase candidate could be found, otherwise returns `true`.
---
---**Warning**! The type field ("shaped", "cooking" or any other) will be ignored if the recipe contains output. Erasing is then done independently from the crafting method.
---@param recipe craft_recipe
---@return boolean
function minetest.clear_craft(recipe) end

---@class chatcommand_definition
---Short parameter description
---
---Use of symbols is as follows:
---* `<>` signifies a placeholder to be replaced when the command is used. For example, when a player name is needed: `<name>`
---* `[]` signifies param is optional and not required when the command is used. For example, if you require param1 but param2 is optional: `<param1> [<param2>]`
---* `|` signifies exclusive or. The command requires one param from the options provided. For example: `<param1> | <param2>`
---* `()` signifies grouping. For example, when param1 and param2 are both required, or only param3 is required: `(<param1> <param2>) | <param3>`
---@field params string
---Full description
---@field description string
---Require the privileges to run
---@field privs table<string, boolean>
---Called when command is run. Returns boolean success and text output.
---
---Special case: The help message is shown to the player if `func` returns `false` without a text output.
---@field func fun(name: string, param: string): boolean, string?

---Register a chat command.
---@param name string
---@param def chatcommand_definition
function minetest.register_chatcommand(name, def) end

---Overrides fields of a chatcommand registered with `minetest.register_chatcommand`.
---@param name string
---@param redef chatcommand_definition
function minetest.override_chatcommand(name, redef) end

---Unregisters a chatcommands registered with `minetest.register_chatcommand`.
---@param name string
function minetest.unregister_chatcommand(name) end

---Map of registered chatcommands, indexed by name.
---@type table<string, chatcommand_definition>
minetest.registered_chatcommands = {}

---@class privilege_definition
---Privilege description.
---@field description string
---Whether to grant the privilege to singleplayer.
---@field give_to_singleplayer boolean
---Whether to grant the privilege to the server admin.
---
---Uses value of 'give_to_singleplayer' by default.
---@field give_to_admin boolean
---Called when given to player 'name' by 'granter_name'.
---
---'granter_name' will be nil if the priv was granted by a mod.
---
---Return true to stop `register_on_priv_grant` from being called.
---@field on_grant fun(name: string, granter_name?: string): boolean
---Called when taken from player  `name` by `revoker_name`.
---
---`revoker_name` will be `nil` if the priv was revoked by a mod.
---
---Return true to stop `register_on_priv_revoke` from being called.
---@field on_revoke fun(name: string, revoker_name?: string): boolean


---Register a new privilege.
---
---If `definition` is a description, the priv will be granted to singleplayer and admin by default.
---
---To allow players with `basic_privs` to grant, see the `basic_privs` minetest.conf setting.
---@param name string Name of the privilege
---@param definition privilege_definition|string Privilege definition or description.
function minetest.register_privilege(name, definition) end

---Map of registered privilege definitions, indexed by name.
---
---Registered privileges can be modified directly in this table.
---@type table<string, privilege_definition>
minetest.registered_privileges = {}
