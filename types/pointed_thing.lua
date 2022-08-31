---@meta

---* `{type="nothing"}`
---* `{type="node", under=pos, above=pos}`
---    * Indicates a pointed node selection box.
---    * `under` refers to the node position behind the pointed face.
---    * `above` refers to the node position in front of the pointed face.
---* `{type="object", ref=ObjectRef}`
---    * Indicate a pointed ObjectRef
---@class pointed_thing
local pointed_thing

---Indicates what is pointed at.
---@type '"nothing"'|'"node"'|'"object"'
pointed_thing.type = nil

---Node position behind the pointed face.
---@type Vector
pointed_thing.under = nil

---Node position in front of the pointed face.
---@type Vector
pointed_thing.above = nil

---Pointed ObjectRef.
---@type ObjectRef
pointed_thing.ref = nil
