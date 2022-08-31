---@meta

---Play a sound.
---
---A handle is returned by default for use with `minetest.sound_stop` and `minetest.sound_fade`.
---
---Ephemeral sounds will not return a handle and can't be stopped or faded.
---
---It is recommend to use this for short sounds that happen in response to player actions (e.g. door closing).
---@param spec SimpleSoundSpec
---@param parameters SoundParameterTable Sound parameter table
---@param ephemeral? boolean Default: `false`
---@return any?
function minetest.sound_play(spec, parameters, ephemeral) end

---Stop sound with the specified handle.
---@param handle any
function minetest.sound_stop(handle) end

---Fade sound with the specified handle to the specified values.
---@param handle any
---@param step number Determines how fast a sound will fade. The gain will change by this much per second, until it reaches the target gain. Note: Older versions used a signed step. This is deprecated, but old code will still work. (the client uses `abs(step)` to correct it)
---@param gain number The target gain for the fade. Fading to zero will delete the sound.
function minetest.sound_fade(handle, step, gain) end
