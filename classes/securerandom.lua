---Interface for the operating system's crypto-secure PRNG.
---@class SecureRandom
local secure_random = {}

---Return next `count` many random bytes, as a string.
---@param count? integer Default: 1, Max: 2048
---@return string
function secure_random:next_bytes(count) end

---Returns nil if a secure random device cannot be found on the system.
---@return SecureRandom?
function SecureRandom() end