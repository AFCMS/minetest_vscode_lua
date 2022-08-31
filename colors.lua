---@meta

---@alias ColorString string

---A ColorSpec specifies a 32-bit color.
---@alias ColorSpec
---| {r: integer, g: integer, b: integer, a: integer}
---| integer
---| string

---The escape sequence sets the text color to `color`
---@param color ColorString
---@return string
function minetest.get_color_escape_sequence(color) end

---Equivalent to: `minetest.get_color_escape_sequence(color)..message..minetest.get_color_escape_sequence("#ffffff")`
---@param color ColorString
---@param message string
---@return string
function minetest.colorize(color, message) end

---The escape sequence sets the background of the whole text element to `color`.
---
---Only defined for item descriptions and tooltips.
---@param color ColorString
---@return string
function minetest.get_background_escape_sequence(color) end

---Removes foreground colors added by `get_color_escape_sequence`.
---@param str string
---@return string
function minetest.strip_foreground_colors(str) end

---Removes background colors added by `get_background_escape_sequence`.
---@param str string
---@return string
function minetest.strip_background_colors(str) end

---Removes all color escape sequences.
---@param str string
---@return string
function minetest.strip_colors(str) end

---Converts a `ColorSpec` to a `ColorString`. If the `ColorSpec` is invalid, returns `nil`.
---@param colorspec ColorSpec
---@return ColorString?
function minetest.colorspec_to_colorstring(colorspec) end

---Converts a `ColorSpec` to a raw string of four bytes in an RGBA layout, returned as a string.
---@param colorspec ColorSpec
---@return string
function minetest.colorspec_to_bytes(colorspec) end
