
---Examples of sound parameter tables:
---
---=> Play locationless on all clients
---
---```lua
---{
---	gain = 1.0,   -- default
---	fade = 0.0,   -- default, change to a value > 0 to fade the sound in
---	pitch = 1.0,  -- default
---}
---```
---
---=> Play locationless to one player
---
---```lua
---{
---	to_player = name,
---	gain = 1.0,   -- default
---	fade = 0.0,   -- default, change to a value > 0 to fade the sound in
---	pitch = 1.0,  -- default
---}
---```
---
---=> Play locationless to one player, looped
---
---```lua
---{
---	to_player = name,
---	gain = 1.0,  -- default
---	loop = true,
---}
---```
---
---=> Play at a location
---
---```lua
---{
---	pos = {x = 1, y = 2, z = 3},
---	gain = 1.0,  -- default
---	max_hear_distance = 32,  -- default, uses an euclidean metric
---}
---```
---
---=> Play connected to an object, looped
---
---```lua
---{
---	object = <an ObjectRef>,
---	gain = 1.0,  -- default
---	max_hear_distance = 32,  -- default, uses an euclidean metric
---	loop = true,
---}
---```
---
---=> Play at a location, heard by anyone *but* the given player
---
---```lua
---{
---	pos = {x = 32, y = 0, z = 100},
---	max_hear_distance = 40,
---	exclude_player = name,
---}
---```
---
---Looped sounds must either be connected to an object or played locationless to one player using `to_player = name`.
---
---A positional sound will only be heard by players that are within `max_hear_distance` of the sound position, at the start of the sound.
---
---`exclude_player = name` can be applied to locationless, positional and object-bound sounds to exclude a single player from hearing them.
---@class SoundParameterTable
local sound_parameter_table = {}

---@type string
sound_parameter_table.to_player = nil

---@type ObjectRef
sound_parameter_table.object = nil

---@type number
sound_parameter_table.gain = nil

---@type number
sound_parameter_table.fade = nil

---@type number
sound_parameter_table.pitch = nil

---@type boolean
sound_parameter_table.loop = nil

---@type Vector
sound_parameter_table.pos = nil

---@type number
sound_parameter_table.max_hear_distance = nil

---@type string
sound_parameter_table.exclude_player = nil