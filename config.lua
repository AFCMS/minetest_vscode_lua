---@diagnostic disable:lowercase-global

name = "Minetest"

files = {
	"mod.conf",
}

words = {
	"minetest%.%w+",
}

configs = {
	{
		key    = "Lua.runtime.version",
		action = "set",
		value  = "LuaJIT",
	},
}
