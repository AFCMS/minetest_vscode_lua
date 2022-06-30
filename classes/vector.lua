---@class Vector: vectorlib
---@field x number
---@field y number
---@field z number

---@class vectorlib
vector = {}

--TODO: support metatables

---Create a new vector
---@param x number
---@param y number
---@param z number
---@return Vector
function vector.new(x, y, z) end

---Create a new vector
---@return Vector
function vector.zero() end

---Returns a copy of the vector `v`
---@param v Vector
---@return Vector
function vector.copy(v) end

---Returns `v, np`, where `v` is a vector read from the given string `s` and `np` is the next position in the string after the vector.
---Returns `nil` on failure.
---@param s string Has to begin with a substring of the form `"(x, y, z)"`
---@param init? integer If given starts looking for the vector at this string index.
---@return Vector?
---@return integer?
function vector.from_string(s, init) end

---Returns a string of the form `"(x, y, z)"`.
---@param v Vector
---@return string
function vector.to_string(v) end

---Returns a vector of length 1 with direction `p1` to `p2`.
---
---If `p1` and `p2` are identical, returns `(0, 0, 0)`.
---@param p1 Vector
---@param p2 Vector
---@return Vector
function vector.direction(p1, p2) end

---Returns zero or a positive number, the distance between `p1` and `p2`.
---@param p1 Vector
---@param p2 Vector
---@return number
function vector.distance(p1, p2) end

---Returns zero or a positive number, the length of vector `v`.
---@param v Vector
---@return number
function vector.length(v) end

---Returns a vector of length 1 with direction of vector `v`.
---
---If `v` has zero length, returns `(0, 0, 0)`.
---@param v Vector
---@return Vector
function vector.normalize(v) end

---Returns a vector, each dimension rounded down.
---@param v Vector
---@return Vector
function vector.floor(v) end

---Returns a vector, each dimension rounded to nearest integer.
---
---At a multiple of `0.5`, rounds away from zero.
---@param v Vector
function vector.round(v) end

---Returns a vector where the function `func` has been applied to each component.
---@param v Vector
---@param func fun(i: number):number
function vector.apply(v, func) end

---Returns a boolean, `true` if the vectors are identical.
---@param a Vector
---@param b Vector
---@return boolean
function vector.equals(a, b) end

---Returns in order `minp`, `maxp` vectors of the cuboid defined by `v1`, `v2`.
---@param v1 Vector
---@param v2 Vector
---@return Vector minp
---@return Vector maxp
function vector.sort(v1, v2) end

---Returns the angle between `v1` and `v2` in radians.
---@param v1 Vector
---@param v2 Vector
---@return number
function vector.angle(v1, v2) end

---Returns the dot product of `v1` and `v2`.
---@param v1 Vector
---@param v2 Vector
---@return number
function vector.dot(v1, v2) end

---Returns the cross product of `v1` and `v2`.
---@param v1 Vector
---@param v2 Vector
---@return Vector
function vector.cross(v1, v2) end

---Returns the sum of the vectors `v` and `(x, y, z)`.
---@param v Vector
---@param x number
---@param y number
---@param z number
---@return Vector
function vector.offset(v, x, y, z) end

---Returns a boolean value indicating whether `v` is a real vector, eg. created by a `vector.*` function.
---
---Returns `false` for anything else, including tables like `{x=3,y=1,z=4}`.
---@param v Vector
---@return boolean
function vector.check(v) end



---If `x` is a vector: Returns the sum of `v` and `x`.
---
---If `x` is a number: Adds `x` to each component of `v`.
---@param v Vector
---@param x Vector | number
---@return Vector
function vector.add(v, x) end

---If `x` is a vector: Returns the difference of `v` subtracted by `x`.
---
---If `x` is a number: Subtracts `x` from each component of `v`.
---@param v Vector
---@param x Vector | number
function vector.subtract(v, x) end


---Returns a scaled vector.
---@param v Vector
---@param s number
---@return Vector
function vector.multiply(v, s) end

---Returns a scaled vector.
---@param v Vector
---@param s number
---@return Vector
function vector.divide(v, s) end


---Applies the rotation `r` (in radians) to `v` and returns the result.
---@param v Vector
---@param r number
---@return Vector
function vector.rotate(v, r) end

---Returns `v1` rotated around axis `v2` by `a` radians according to the right hand rule.
---@param v1 Vector
---@param v2 Vector
---@param a number
---@return Vector
function vector.rotate_around_axis(v1, v2, a) end

---Returns a rotation vector for `direction` pointing forward using `up` as the up vector.
---
---If `up` is omitted, the roll of the returned vector defaults to zero.
---
---Otherwise `direction` and `up` need to be vectors in a 90 degree angle to each other.
---@param direction Vector
---@param up? Vector
function vector.dir_to_rotation(direction, up) end
