---@class privilege_definition
---@field description string
---@field give_to_singleplayer boolean
---@field give_to_admin boolean
---@field on_grant fun(name: string, granter_name: string): boolean
---@field on_revoke fun(name: string, revoker_name: string): boolean

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