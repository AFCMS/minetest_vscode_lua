---@class VoxelArea
VoxelArea = {}

---@type Vector
VoxelArea.MinEdge = nil

---@type Vector
VoxelArea.MaxEdge = nil

---@type number
VoxelArea.ystride = nil

---@type number
VoxelArea.zstride = nil

---Create a new `VoxelArea`.
---@param o {MinEdge: Vector, MaxEdge: Vector}
---@return VoxelArea
function VoxelArea:new(o) end

---Returns a 3D vector containing the size of the area formed by `MinEdge` and `MaxEdge`.
---@return Vector
function VoxelArea:getExtent() end

---Returns the volume of the area formed by `MinEdge` and `MaxEdge`.
---@return number
function VoxelArea:getVolume() end

---Returns the index of an absolute position in a flat array starting at `1`.
---* `x`, `y` and `z` must be integers to avoid an incorrect index result.
---* The position (x, y, z) is not checked for being inside the area volume, being outside can cause an incorrect index result.
---* Useful for things like `VoxelManip`, raw Schematic specifiers, `PerlinNoiseMap:get2d`/`3dMap`, and so on.
---@param x integer
---@param y integer
---@param z integer
---@return integer
function VoxelArea:index(x, y, z) end

---Same functionality as `VoxelArea:index(x, y, z)` but takes a vector as param.
---
---As with `index(x, y, z)`, the components of `p` must be integers, and `p` is not checked for being inside the area volume.
---@param p Vector
---@return integer
function VoxelArea:indexp(p) end

---Returns the absolute position vector corresponding to index `i`.
---@param i integer
---@return Vector
function VoxelArea:position(i) end

---Check if (`x`,`y`,`z`) is inside area formed by `MinEdge` and `MaxEdge`.
---@param x number
---@param y number
---@param z number
---@return boolean
function VoxelArea:contains(x, y, z) end

---Same functionality as `VoxelArea:contains(x, y, z)` but takes a vector as param.
---@param p Vector
---@return boolean
function VoxelArea:containsp(p) end

---Same functionality as `VoxelArea:contains(x, y, z)` but takes an index as param.
---@param i integer
function VoxelArea:containsi(i) end

---Returns an iterator that returns indices.
---
---From (`minx`,`miny`,`minz`) to (`maxx`,`maxy`,`maxz`) in the order of `[z [y [x]]]`.
---@param minx integer
---@param miny integer
---@param minz integer
---@param maxx integer
---@param maxy integer
---@param maxz integer
function VoxelArea:iter(minx, miny, minz, maxx, maxy, maxz) end

---Same functionality as `VoxelArea:iter(minx, miny, minz, maxx, maxy, maxz)` but takes vector as params.
---@param minp Vector
---@param maxp Vector
function VoxelArea:iterp(minp, maxp) end
