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

