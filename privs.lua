---@class privilege_definition
local privilege_definition = {}

---Privilege description.
---@type string
privilege_definition.description = nil

---Whether to grant the privilege to singleplayer.
---@type boolean
privilege_definition.give_to_singleplayer = nil

---Whether to grant the privilege to the server admin.
---
---Uses value of 'give_to_singleplayer' by default.
---@type boolean
privilege_definition.give_to_admin = nil

---Called when given to player 'name' by 'granter_name'.
---
---'granter_name' will be nil if the priv was granted by a mod.
---
---Return true to stop `register_on_priv_grant` from being called.
---@type fun(name: string, granter_name?: string): boolean
privilege_definition.on_grant = nil

---Called when taken from player 'name' by 'revoker_name'.
---
---'revoker_name' will be nil if the priv was revoked by a mod.
---
---Return true to stop `register_on_priv_revoke` from being called.
---@type fun(name: string, revoker_name?: string): boolean
privilege_definition.on_revoke = nil


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