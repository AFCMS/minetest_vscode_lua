
---Returns a string which makes `obj` human-readable, handles reference loops.
---@param obj any arbitrary variable
---@param name string default: "_"
---@param dumped table default: {}
---@return string
function dump2(obj, name, dumped) end


---Returns a string which makes `obj` human-readable.
---@param obj any
---@param dumped table default: {}
---@return string
function dump(obj, dumped) end

---Get the hypotenuse of a triangle with legs x and y.
---
---Useful for distance calculation.
---@param x number
---@param y number
---@return number
function math.hypot(x, y) end

--FIXME: not supporting negative numbers

---Get the sign of a number.
---
---If the absolute value of `x` is within the `tolerance` or `x` is NaN, `0` is returned.
---@param x number
---@param tolerance number
---@return '-1'|0|1
function math.sign(x, tolerance) end

---Returns the factorial of `x`
---@param x number
---@return number
function math.factorial(x) end

---Returns `x` rounded to the nearest integer.
---
---At a multiple of 0.5, rounds away from zero.
---@param x number
---@return integer
function math.round(x) end

---Returns the string without whitespace pre- and suffixes
---
---e.g. `string.trim("\n \t\tfoo bar\t ")` returns `"foo bar"`
function string.trim() end