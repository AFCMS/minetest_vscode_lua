---@class entity_definition
---A table of object properties, see the `Object properties` section.
---
---Object properties being read directly from the entity definition table is deprecated.
---
---Define object properties in this `initial_properties` table instead.
---@field initial_properties object_properties
---@field on_activate fun(self: Luaentity, staticdata, dtime_s: number)
---@field on_step fun(self: Luaentity, dtime: number, moveresult: moveresult)
---@field on_punch fun(self: Luaentity, puncher: ObjectRef, time_from_last_punch: number, tool_capabilities: tool_capabilities, dir: Vector)
---@field on_rightclick fun(self: Luaentity, clicker: ObjectRef)
---@field get_staticdata fun(self: Luaentity): string