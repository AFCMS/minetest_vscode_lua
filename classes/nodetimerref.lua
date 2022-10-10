---@meta

---A high resolution persistent per-node timer.
---@class NodeTimerRef
local node_timer_ref = {}

---Set a timer's state.
---
---Will trigger the node's `on_timer` function after `(timeout - elapsed)` seconds.
---@param timeout number In seconds, support fractional values
---@param elapsed number In seconds, support fractional values
function node_timer_ref:set(timeout, elapsed) end

---Start a timer.
---
---Equivalent to `set(timeout,0)`.
---@param timeout number In seconds, support fractional values
function node_timer_ref:start(timeout) end

---Stops the timer.
function node_timer_ref:stop() end

---Returns current timeout in seconds.
---
---If `timeout` equals `0`, timer is inactive.
---@return number
---@nodiscard
function node_timer_ref:get_timeout() end

---Returns current elapsed time in seconds.
---@return number
---@nodiscard
function node_timer_ref:get_elapsed() end

---Returns boolean state of the timer.
---@return boolean
---@nodiscard
function node_timer_ref:is_started() end
