---@meta

---Specifies a sound name, gain (=volume) and pitch.
---
---This is either a string or a table.
---
---In string form, you just specify the sound name or the empty string for no sound.
---
---Table form has the following fields:
---
---* `name`: Sound name
---* `gain`: Volume (`1.0` = 100%)
---* `pitch`: Pitch (`1.0` = 100%)
---`gain` and `pitch` are optional and default to `1.0`.
---
---Examples:
---
---* `""`: No sound
---* `{}`: No sound
---* `"default_place_node"`: Play e.g. `default_place_node.ogg`
---* `{name = "default_place_node"}`: Same as above
---* `{name = "default_place_node", gain = 0.5}`: 50% volume
---* `{name = "default_place_node", gain = 0.9, pitch = 1.1}`: 90% volume, 110% pitch
---@alias SimpleSoundSpec SimpleSoundSpecTable|string

---@class SimpleSoundSpecTable
local simple_sound_spec = {}

---Sound name.
---@type string
simple_sound_spec.name = nil

---Volume (`1.0` = `100%`)
---@type number
simple_sound_spec.gain = nil

---Pitch (`1.0` = `100%`)
---@type number
simple_sound_spec.pitch = nil
