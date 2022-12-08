---@meta

-- Builtin constants

---Built-in Content ID of uknown node (for use with VoxelManip API)
minetest.CONTENT_UNKNOWN = 125

---Built-in Content ID of air node (for use with VoxelManip API)
minetest.CONTENT_AIR = 126

---Built-in Content ID of ignore node (for use with VoxelManip API)
minetest.CONTENT_IGNORE = 127

---Size of mapblocks in nodes
minetest.MAP_BLOCKSIZE = 16

---Default maximal HP of a player
minetest.PLAYER_MAX_HP_DEFAULT = 20

---Default maximal breath of a player
minetest.PLAYER_MAX_BREATH_DEFAULT = 10



---Maximum value for node `"light_source"` parameter
minetest.LIGHT_MAX = 14



---Block emerge status constants (for use with `minetest.emerge_area`)
minetest.EMERGE_CANCELLED = 0

---Block emerge status constants (for use with `minetest.emerge_area`)
minetest.EMERGE_ERRORED = 1

---Block emerge status constants (for use with `minetest.emerge_area`)
minetest.EMERGE_FROM_MEMORY = 2

---Block emerge status constants (for use with `minetest.emerge_area`)
minetest.EMERGE_FROM_DISK = 3

---Block emerge status constants (for use with `minetest.emerge_area`)
minetest.EMERGE_GENERATED = 4


---@alias emerge_status
---| `minetest.EMERGE_CANCELLED`
---| `minetest.EMERGE_ERRORED`
---| `minetest.EMERGE_FROM_MEMORY`
---| `minetest.EMERGE_FROM_DISK`
---| `minetest.EMERGE_GENERATED`


---Directory separator in use on the system.
---@type '"/"'|'"\\\\"'
DIR_DELIM = nil

---Platform Minetest was build for.
---@type '"Android"'|'"Linux"'|'"Windows"'|'"BSD"'|'"OSX"'|'"iOS"'|'"Apple"'|'"AIX"'|'"HP-UX"'|'"Solaris"'|'"SunOS"'|'"Haiku"'|'"Cygwin"'|'"Posix"'|'"Unix"'|'"?"'
PLATFORM = nil
