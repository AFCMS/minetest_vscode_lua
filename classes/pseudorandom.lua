---A 16-bit pseudorandom number generator.
---
---Uses a well-known LCG algorithm introduced by K&R.
---@class PseudoRandom
local pseudo_random = {}

---Returns next random integer.
---
---Return next integer random number by default [`0`...`32767`].
---
---Return next integer random number between [`min`...`max`] overwise.
---
---`((max - min) == 32767) or ((max-min) <= 6553))` must be true due to the simple implementation making bad distribution otherwise.
---@param min? integer
---@param max? integer
---@return integer
function pseudo_random:next(min, max) end

---Create a PseudoRandom generator.
---@param seed number
---@return PseudoRandom
function PseudoRandom(seed) end