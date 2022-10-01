---@meta

---Returns a string which makes `obj` human-readable, handles reference loops.
---@param obj any arbitrary variable
---@param name string default: "_"
---@param dumped table default: {}
---@return string
---@nodiscard
function dump2(obj, name, dumped) end

---Returns a string which makes `obj` human-readable.
---@param obj any
---@param dumped? table default: {}
---@return string
---@nodiscard
function dump(obj, dumped) end

---Get the hypotenuse of a triangle with legs x and y.
---
---Useful for distance calculation.
---
---**MINETEST API**
---@param x number
---@param y number
---@return number
---@nodiscard
function math.hypot(x, y) end

---Get the sign of a number.
---
---If the absolute value of `x` is within the `tolerance` or `x` is NaN, `0` is returned.
---
---**MINETEST API**
---@param x number
---@param tolerance number
---@return -1|0|1
---@nodiscard
function math.sign(x, tolerance) end

---Returns the factorial of `x`
---
---**MINETEST API**
---@param x number
---@return number
---@nodiscard
function math.factorial(x) end

---Returns `x` rounded to the nearest integer.
---
---At a multiple of 0.5, rounds away from zero.
---
---**MINETEST API**
---@param x number
---@return integer
---@nodiscard
function math.round(x) end

---Split a string.
---
---e.g. `string.split("a,b", ",")` returns `{"a","b"}`
---
---**MINETEST API**
---@param str string
---@param separator? string Default: `","`
---@param include_empty? boolean Default: `false`
---@param max_splits? integer If it's negative, splits aren't limited. Default: `-1`
---@param sep_is_pattern? boolean It specifies whether separator is a plain string or a pattern (regex). Default: `false`
---@return string[]
---@nodiscard
function string.split(str, separator, include_empty, max_splits, sep_is_pattern) end

---Returns the string without whitespace pre- and suffixes
---
---e.g. `string.trim("\n \t\tfoo bar\t ")` returns `"foo bar"`
---
---**MINETEST API**
---@param str string
---@return string
---@nodiscard
function string.trim(str) end

---Adds newlines to the string to keep it within the specified character limit.
---
---Note that the returned lines may be longer than the limit since it only splits at word borders.
---@param str string
---@param limit integer Maximal amount of characters in one line
---@param as_table? boolean If set to true, a table of lines instead of a string is returned. Default: `false`
---@return string|table
---@nodiscard
function minetest.wrap_text(str, limit, as_table) end

---Converts the position `pos` to a human-readable, printable string in the form `"(X,Y,Z)"`
---@param pos Vector
---@param decimal_places? number If specified, the `x`, `y` and `z` values of the position are rounded to the given decimal place.
---@return string
---@nodiscard
function minetest.pos_to_string(pos, decimal_places) end

---Parse a string in the form `"(X,Y,Z)"`.
---
---If the string can't be parsed to a position, nothing is returned.
---@param str string
---@return Vector?
---@nodiscard
function minetest.string_to_pos(str) end

---Converts a string in the form `"(X1, Y1, Z1) (X2, Y2, Z2)"` representing an area box into two positions
---@param str string
---@return Vector?
---@return Vector?
---@nodiscard
function minetest.string_to_area(str) end

---Returns true if passed `'y'`, `'yes'`, `'true'` or a number that isn't zero.
---@param arg any
---@return boolean
---@nodiscard
function minetest.is_yes(arg) end

---Returns true when the passed number represents `NaN`.
---@param arg number
---@return boolean
---@nodiscard
function minetest.is_nan(arg) end

---Returns time with microsecond precision. May not return wall time.
---@return number
---@nodiscard
function minetest.get_us_time() end

---Returns a deep copy of `table`.
---
---**MINETEST API**
---@param table table
---@return table
---@nodiscard
function table.copy(table) end

---Returns the smallest numerical index containing the value `val` in the table `list`.
---
---Non-numerical indices are ignored.
---
---If `val` could not be found, `-1` is returned. `list` must not have negative indices.
---
---**MINETEST API**
---@param list any[]
---@param val any
---@return integer
---@nodiscard
function table.indexof(list, val) end

---Appends all values in `other_table` to `table`, uses `#table + 1` to find new indices.
---
---**MINETEST API**
---@param table table
---@param other_table table
function table.insert_all(table, other_table) end

---Returns a table with keys and values swapped.
---
---If multiple keys in `t` map to the same value, it is unspecified which value maps to that key.
---
---**MINETEST API**
---@param t table
---@return table
---@nodiscard
function table.key_value_swap(t) end

---Shuffles elements `from` to `to` in `table` in place
---
---**MINETEST API**
---@param table table
---@param from? integer Defaults to `1`
---@param to? integer Defaults to `#table`
---@param random_func? function This function receives two integers as arguments and should return a random integer inclusively between them. Defaults to `math.random`
function table.shuffle(table, from, to, random_func) end
