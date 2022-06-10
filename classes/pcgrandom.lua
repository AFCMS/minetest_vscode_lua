
---A 32-bit pseudorandom number generator.
---Uses PCG32, an algorithm of the permuted congruential generator family, offering very strong randomness.
---@class PcgRandom
local pcg_random = {}

---Returns next random integer.
---
---min, max defaults to `-2147483648` and `2147483647`
---@param min? integer
---@param max? integer
---@return integer
function pcg_random:next(min, max) end

---Return normally distributed random number between `min` and `max`.
---
---This is only a rough approximation of a normal distribution with:
---* `mean = (max - min) / 2`, and
---* `variance = (((max - min + 1) ^ 2) - 1) / (12 * num_trials)`
---* Increasing `num_trials` improves accuracy of the approximation
---@param min integer
---@param max integer
---@param num_trials integer Default: 6
---@return integer
function pcg_random:rand_normal_dist(min, max, num_trials) end

--FIXME: document params

---Create a PcgRandom generator.
---@param seed number
---@param sequence? any
---@return PcgRandom
function PcgRandom(seed, sequence) end