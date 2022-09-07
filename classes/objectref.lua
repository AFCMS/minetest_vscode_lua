---@meta

---A reference to an entity.
---
---This is basically a reference to a C++ `ServerActiveObject`.
---@class ObjectRef
local ObjectRef = {}

-------------
-- Methods --
-------------

---Return position of the object
---@return Vector
function ObjectRef:get_pos() end

---Set position of the object
---@param pos Vector
function ObjectRef:set_pos(pos) end

---Returns the velocity of the object as a vector.
---@return Vector
function ObjectRef:get_velocity() end

---In comparison to using `get_velocity`, adding the velocity and then using `set_velocity`, `add_velocity` is supposed to avoid synchronization problems.
---
---Additionally, players also do not support `set_velocity`.
---
---If a player:
--- * Does not apply during free_move.
--- * Note that since the player speed is normalized at each move step, increasing e.g. Y velocity beyond what would usually be achieved (see: physics overrides) will cause existing X/Z velocity to be reduced.
--- * Example: `add_velocity(vector.new(0, 6.5, 0))` is equivalent to pressing the jump key (assuming default settings)
---@param vel Vector
function ObjectRef:add_velocity(vel) end

---Does an interpolated move for Lua entities for visually smooth transitions.
---
---If `continuous` is true (default: false), the Lua entity will not be moved to the current position before starting the interpolated move.
---
---For players this does the same as `set_pos`,`continuous` is ignored.
---@param pos Vector
---@param continuous boolean
function ObjectRef:move_to(pos, continuous) end

---Simulate a punch of the object.
---@param puncher ObjectRef
---@param time_from_last_punch number
---@param tool_capabilities tool_capabilities
---@param direction? Vector
function ObjectRef:punch(puncher, time_from_last_punch, tool_capabilities, direction) end

---Simulate a rightclick of the object.
---@param clicker ObjectRef
function ObjectRef:right_click(clicker) end

---Returns number of health points of the object.
---@return integer
function ObjectRef:get_hp() end

--FIXME: reason table
---Set number of health points of the object.
---@param hp integer
---@param reason table
function ObjectRef:set_hp(hp, reason) end

---Returns an `InvRef` for players, otherwise returns `nil`
---@return InvRef?
function ObjectRef:get_inventory() end

---Returns the inventory list the wielded item is in.
---@return string
function ObjectRef:get_wield_list() end

---Returns the index of the wielded item.
---@return integer
function ObjectRef:get_wield_index() end

---Returns the wielded `ItemStack`
---@return ItemStack
function ObjectRef:get_wielded_item() end

---Replaces the wielded item, returns `true` if successful.
---@param item ItemStack
---@return boolean
function ObjectRef:set_wielded_item(item) end

---Returns a table with the armor group ratings.
---@return { [string]: integer }
function ObjectRef:get_armor_groups() end

---Set armor group ratings.
---@param groups { [string]: integer }
function ObjectRef:set_armor_groups(groups) end

---Get object animation.
---@return {x: number, y: number} frame_range
---@return number frame_speed
---@return number frame_blend
---@return boolean frame_loop
function ObjectRef:get_animation() end

---Set object animation.
---@param frame_range {x: number, y: number}
---@param frame_speed number
---@param frame_blend number
---@param frame_loop boolean
function ObjectRef:set_animation(frame_range, frame_speed, frame_blend, frame_loop) end

---Set object animation frame speed.
---@param frame_speed number
function ObjectRef:set_animation_frame_speed(frame_speed) end

---Attach object to another object.
---
---This command may fail silently (do nothing) when it would result in circular attachments.
---@param parent ObjectRef
---@param bone? string
---@param position? Vector
---@param rotation? Vector
---@param forced_visible? boolean
function ObjectRef:set_attach(parent, bone, position, rotation, forced_visible) end

---Returns parent, bone, position, rotation, forced_visible or nil if it isn't attached.
---@return ObjectRef? parent
---@return string? bone
---@return Vector? position
---@return Vector? rotation
---@return boolean? forced_visible
function ObjectRef:get_attach() end

---Returns a list of `ObjectRefs` that are attached to the object.
---@return ObjectRef[]
function ObjectRef:get_children() end

---Detach object.
function ObjectRef:set_detach() end

---Set position of one of the bone of the object.
---@param bone? string
---@param position? Vector
---@param rotation? Vector
function ObjectRef:set_bone_position(bone, position, rotation) end

---Returns position and rotation of the bone.
---@param bone string
---@return Vector position
---@return Vector rotation
function ObjectRef:get_bone_position(bone) end

--FIXME: document object_properties

---Object Properties
---@class object_properties
---@field hp_max integer
---@field breath_max integer
---@field zoom_fov number
---@field eye_height number
---@field physical boolean
---@field collide_with_objects boolean
---@field collisionbox number[]
---@field selectionbox number[]
---@field pointable boolean
---@field visual '"cube"'|'"sprite"'|'"upright_sprite"'|'"mesh"'|'"wielditem"'|'"item"'
---@field visual_size Vector
---@field mesh string
---@field textures string[]
---@field colors table
---@field use_texture_alpha boolean
---@field spritediv {x: integer, y: integer}
---@field initial_sprite_basepos {x: integer, y: integer}
---@field is_visible boolean
---@field makes_footstep_sound boolean
---@field automatic_rotate number
---@field stepheight number
---@field automatic_face_movement_dir number
---@field automatic_face_movement_max_rotation_per_sec number
---@field backface_culling boolean
---@field glow integer
---@field nametag string
---@field nametag_color ColorSpec
---@field nametag_bgcolor ColorSpec
---@field infotext string
---@field static_save boolean
---@field damage_texture_modifier string
---@field shaded boolean
---@field show_on_minimap boolean

---Returns object properties.
---@return object_properties
function ObjectRef:get_properties() end

---Set objects properties.
---@param object_properties object_properties
function ObjectRef:set_properties(object_properties) end

---Returns true for players, false otherwise.
---@return boolean
function ObjectRef:is_player() end

---@class nametag_attributes
---@field text string
---@field color ColorSpec
---@field bgcolor ColorSpec|'false'

---Returns a table with the attributes of the nametag of an object.
---@return nametag_attributes
function ObjectRef:get_nametag_attributes() end

---Sets the attributes of the nametag of the object.
---@param attributes nametag_attributes
function ObjectRef:set_nametag_attributes(attributes) end

---------------------
-- Lua entity only --
---------------------

---**Luaentity Only**
---
---Remove object.
---
---The object is removed after returning from Lua. However the `ObjectRef` itself instantly becomes unusable with all further method calls having no effect and returning `nil`.
function ObjectRef:remove() end

---**Luaentity Only**
---
---Set the object velocity.
---@param vel Vector
function ObjectRef:set_velocity(vel) end

---**Luaentity Only**
---
---Set the object acceleration.
---@param acc Vector
function ObjectRef:set_acceleration(acc) end

---**Luaentity Only**
---
---Returns the acceleration of the object.
---@return Vector
function ObjectRef:get_acceleration() end

---**Luaentity Only**
---
---Set the object rotation.
---
---`rot` is a vector (radians)
---
---`X` is pitch (elevation), `Y` is yaw (heading) and `Z` is roll (bank).
---@param rot Vector
function ObjectRef:set_rotation(rot) end

---**Luaentity Only**
---
---Get the object rotation.
---
---Returns a vector (radians)
---
---`X` is pitch (elevation), `Y` is yaw (heading) and `Z` is roll (bank).
---@return Vector
function ObjectRef:get_rotation() end

---**Luaentity Only**
---
---Sets the yaw (heading) of the object in radians.
---@param yaw number
function ObjectRef:set_yaw(yaw) end

---**Luaentity Only**
---
---Returns the yaw (heading) of the object in radians.
---@return number
function ObjectRef:get_yaw() end

---**Luaentity Only**
---
---Set a texture modifier to the base texture, for sprites and meshes.
---
---When calling `set_texture_mod` again, the previous one is discarded.
---@param mod string
function ObjectRef:set_texture_mod(mod) end

---**Luaentity Only**
---
---Returns the current texture modifier of the object.
---@return string
function ObjectRef:get_texture_mod() end

---**Luaentity Only**
---
---Specifies and starts a sprite animation.
---
---Animations iterate along the frame `y` position.
---@param start_frame {x: integer, y: integer} The coordinate of the first frame, default: `{x=0, y=0}`
---@param num_frames integer Total frames in the texture, default: `1`
---@param framelenght number Time per animated frame in seconds, default: `0.2`
---@param select_x_by_camera boolean Only for visual = `sprite`.
---Changes the frame `x` position according to the view direction. default: `false`.
--- * First column:  subject facing the camera
--- * Second column: subject looking to the left
--- * Third column:  subject backing the camera
--- * Fourth column: subject looking to the right
--- * Fifth column:  subject viewed from above
--- * Sixth column:  subject viewed from below
function ObjectRef:set_sprite(start_frame, num_frames, framelenght, select_x_by_camera) end

---**Luaentity Only**
---
---Returns entity name.
---
---**DEPRECATED**, will be removed in a future version.
---@deprecated
---@return string
function ObjectRef:get_entity_name() end

--FIXME

---**Luaentity Only**
---
---Returns object luaentity.
---@return table
function ObjectRef:get_luaentity() end

-----------------
-- Player only --
-----------------

---**Player Only**
---
---Returns player name.
---
---Returns `""` if object isn't a player.
---@return string
function ObjectRef:get_player_name() end

---**Player Only**
---
---**DEPRECATED**, use `get_velocity()` instead.
---@deprecated
---@return Vector
function ObjectRef:get_player_velocity() end

---**Player Only**
---
---**DEPRECATED**, use `add_velocity(vel)` instead.
---@deprecated
---@param vel Vector
function ObjectRef:add_player_velocity(vel) end

---**Player Only**
---
---Get camera direction as a unit vector.
---@return Vector
function ObjectRef:get_look_dir() end

---**Player Only**
---
---Returns player pitch in radians.
---
---Angle ranges between `-pi/2` and `pi/2`, which are straight up and down respectively.
---@return number
function ObjectRef:get_look_vertical() end

---**Player Only**
---
---Set player pitch in radians.
---
---Angle ranges between `-pi/2` and `pi/2`, which are straight up and down respectively.
---@param radians number
function ObjectRef:set_look_vertical(radians) end

---**Player Only**
---
---Returns player yaw in radians.
---
---Angle is counter-clockwise from the +z direction.
---@return number
function ObjectRef:get_look_horizontal() end

---**Player Only**
---
---Set player yaw in radians.
---
---Angle is counter-clockwise from the +z direction.
---@param radians number
function ObjectRef:set_look_horizontal(radians) end

---**Player Only**
---
---Returns look pitch in radians.
---
---Angle ranges between -pi/2 and pi/2, which are straight down and up respectively.
---
---**DEPRECATED AS BROKEN**, use `get_look_vertical()`.
---@deprecated
---@return number
function ObjectRef:get_look_pitch() end

---**Player Only**
---
---Set look pitch in radians.
---
---Angle ranges between -pi/2 and pi/2, which are straight down and up respectively.
---
---**DEPRECATED AS BROKEN**, use `set_look_vertical(rad)`.
---@deprecated
---@param rad number
function ObjectRef:set_look_pitch(rad) end

---**Player Only**
---
---Returns look yaw in radians.
---
---Angle ranges between -pi/2 and pi/2, which are straight down and up respectively.
---
---**DEPRECATED AS BROKEN**, use `get_look_horizontal()`.
---@deprecated
---@return number
function ObjectRef:get_look_yaw() end

---**Player Only**
---
---Set look yaw in radians.
---
---Angle ranges between -pi/2 and pi/2, which are straight down and up respectively.
---
---**DEPRECATED AS BROKEN**, use `set_look_horizontal(rad)`.
---@deprecated
---@param rad number
function ObjectRef:set_look_yaw(rad) end

---**Player Only**
---
---Returns player breath.
--- * `0`: player is drowning
--- * max: bubbles bar is not shown
--- * see [object_properties] for more information
---@return integer
function ObjectRef:get_breath() end

---**Player Only**
---
---Sets player breath.
--- * `0`: player is drowning
--- * max: bubbles bar is not shown
--- * see [object_properties] for more information
---@param value integer
function ObjectRef:set_breath(value) end

---**Player Only**
---
---Set Server-Sent FOV value for player.
---@param fov number FOV value. Set to `0` to clear FOV override.
---@param is_multiplier? boolean Set to `true` if the FOV value is a multiplier. Default: `false`
---@param transition_time? number If defined, enables smooth FOV transition. Interpreted as the time (in seconds) to reach target FOV. If set to 0, FOV change is instantaneous. Default: `0`
function ObjectRef:set_fov(fov, is_multiplier, transition_time) end

---**Player Only**
---
---Returns Server-Sent FOV value for player.
---@return number fov FOV value. Returns `0` if an FOV override doesn't exist.
---@return boolean is_multiplier Set to `true` if the FOV value is a multiplier.
---@return number transition_time Time (in seconds) to reach target FOV.
function ObjectRef:get_fov() end

---**Player Only**
---
---Sets an extra attribute with value on player.
---
---`value` must be a string, or a number which will be converted to a string.
---
---If `value` is `nil`, remove the attribute from player.
---
---**DEPRECATED**, use get_meta() instead
---@deprecated
---@param attribute string
---@param value? string|number
function ObjectRef:set_attribute(attribute, value) end

---**Player Only**
---
---Returns value (a string) for a per-player attribute.
---
---Returns `nil` if no attribute found.
---
---**DEPRECATED**, use get_meta() instead
---@deprecated
---@param attribute string
---@return string?
function ObjectRef:get_attribute(attribute) end

---**Player Only**
---
---Returns a `PlayerMetaRef`
---@return PlayerMetaRef
function ObjectRef:get_meta() end

---**Player Only**
---
---Redefine player's inventory form.
---
---Should usually be called in `on_joinplayer`.
---
---If `formspec` is `""`, the player's inventory is disabled.
---@param formspec string
function ObjectRef:set_inventory_formspec(formspec) end

---**Player Only**
---
---Redefine the formspec string that will be added to every formspec shown to the player, except those with a `no_prepend[]` tag.
---
---This should be used to set style elements such as `background[]` and `bgcolor[]`, any non-style elements (eg: label) may result in weird behaviour.
---
---Only affects formspecs shown after this is called.
---@param formspec string
function ObjectRef:set_formspec_prepend(formspec) end

---**Player Only**
---
---Returns table with player pressed keys.
---
---The table consists of fields with the following boolean values representing the pressed keys: `up`, `down`, `left`, `right`, `jump`, `aux1`, `sneak`, `dig`, `place`, `LMB`, `RMB`, and `zoom`.
---
---The fields `LMB` and `RMB` are equal to `dig` and `place` respectively, and exist only to preserve backwards compatibility.
---
---Returns `{}` if object isn't a player.
---@return {up: boolean, down: boolean, left: boolean, right: boolean, jump: boolean, aux1: boolean, sneak: boolean, dig: boolean, place: boolean, LMB: boolean, RMB: boolean, zoom: boolean}
function ObjectRef:get_player_control() end

---**Player Only**
---
---Returns integer with bit packed player pressed keys.
---
---Bits:
---* 0 - up
---* 1 - down
---* 2 - left
---* 3 - right
---* 4 - jump
---* 5 - aux1
---* 6 - sneak
---* 7 - dig
---* 8 - place
---* 9 - zoom
---
---Returns `0` (no bits set) if the object is not a player.
---@return integer
function ObjectRef:get_player_control_bits() end

---@class physics_override
local physics_override = {}

---Multiplier to default walking speed value (default: `1`)
---@type number
physics_override.speed = nil

---Multiplier to default jump value (default: `1`)
---@type number
physics_override.jump = nil

---Multiplier to default gravity value (default: `1`)
---@type number
physics_override.gravity = nil

---Whether player can sneak (default: `true`)
---@type boolean
physics_override.sneak = nil

---Whether player can use the new move code replications of the old sneak side-effects: sneak ladders and 2 node sneak jump (default: `false`)
---@type boolean
physics_override.sneak_glitch = nil

---Use new move/sneak code. When `false` the exact old code is used for the specific old sneak behaviour (default: `true`)
---@type boolean
physics_override.new_move = nil

---**Player Only**
---
---Set physics overrides for player.
---@param override_table physics_override
function ObjectRef:set_physics_override(override_table) end

---**Player Only**
---
---Returns the table given to `set_physics_override`.
---@return physics_override
function ObjectRef:get_physics_override() end

--TODO: improve self documentation of hud definition using minetest modding book

---@class hud_definition
local hud_definition = {}

---Type of element.
---@type '"image"'|'"text"'|'"statbar"'|'"inventory"'|'"waypoint"'|'"image_waypoint"'|'"compass"'|'"minimap"'
hud_definition.type = nil

---Position of the element, starting from the top left corner of the screen.
---
---`{x=0.5, y=0.5}` would place the element at the center of the screen while `{x=0, y=0}` would keep it in the top left corner.
---@type {x: number, y: number}
hud_definition.position = nil

---Name of the element
---@type string
hud_definition.name = nil

---@type {x: number, y: number}
hud_definition.scale = nil

---@type string
hud_definition.text = nil

---@type string
hud_definition.text2 = nil

---@type number
hud_definition.number = nil

---**TYPE: inventory**
---
---Selected item in inventory. 0 for no item selected.
---@type integer
hud_definition.item = nil

---Direction: `0`: left-right, `1`: right-left, `2`: top-bottom, `3`: bottom-top
---@type 0|1|2|3
hud_definition.direction = nil

---@type {x: number, y: number}
hud_definition.alignment = nil

---@type {x: number, y: number}
hud_definition.offset = nil

---Size of the element in pixels.
---@type {x: number, y: number}
hud_definition.size = nil

---Lower z-index HUDs are displayed behind higher z-index HUDs.
---@type integer
hud_definition.z_index = nil

---Defint font style for "text" elements: bitfield with `1` = bold, `2` = italic, `4` = monospace
---@type integer
hud_definition.style = nil

---**Player Only**
---
---Add a HUD element to the player, returns ID on success
---@param definition hud_definition
---@return integer?
function ObjectRef:hud_add(definition) end

---**Player Only**
---
---Remove the HUD element of the specified id.
---@param id integer
function ObjectRef:hud_remove(id) end

---**Player Only**
---
---Change a value of a previously added HUD element.
---@param id integer
---@param stat '"position"'|'"name"'|'"scale"'|'"text"'|'"number"'|'"item"'
---@param value any
function ObjectRef:hud_change(id, stat, value) end

---**Player Only**
---
---Returns the HUD element definition structure of the specified ID
---@param id integer
---@return hud_definition?
function ObjectRef:hud_get(id) end

---@class hud_flags
---@field hotbar boolean
---@field healthbar boolean
---@field crosshair boolean
---@field wielditem boolean
---@field breathbar boolean
---@field minimap boolean
---@field minimap_radar boolean
---@field basic_debug boolean

---**Player Only**
---
---Sets specified HUD flags for player.
---@param flags hud_flags
function ObjectRef:hud_set_flags(flags) end

---**Player Only**
---
---Returns player HUD flags.
---@return hud_flags
function ObjectRef:hud_get_flags() end

---**Player Only**
---
---Sets number of slots shown in builtin hotbar.
---@param count integer Number of items, between `1` and `32`
function ObjectRef:hud_set_hotbar_itemcount(count) end

---**Player Only**
---
---Returns number of slots shown in builtin hotbar.
---@return integer
function ObjectRef:hud_get_hotbar_itemcount() end

---**Player Only**
---
---Sets hotbar background image.
---@param texturename string
function ObjectRef:hud_set_hotbar_image(texturename) end

---**Player Only**
---
---Returns hotbar background image.
---@return string
function ObjectRef:hud_get_hotbar_image() end

---**Player Only**
---
---Sets selected hotbar background image.
---@param texturename string
function ObjectRef:hud_set_hotbar_selected_image(texturename) end

---**Player Only**
---
---Returns selected hotbar background image.
---@return string
function ObjectRef:hud_get_hotbar_selected_image() end

--FIXME: unclear lua_api doc

---**Player Only**
---
---Overrides the available minimap modes, toggle order and changes the selected mode.
---@param modes table
---@param selected_mode integer
function ObjectRef:set_minimap_modes(modes, selected_mode) end

---@class sky_parameters
local sky_parameters = {}

---Fog color in "skybox" and "plain" modes.
---@type ColorSpec
sky_parameters.base_color = nil

--- Available types:
---* `"regular"`: Uses 0 textures, `base_color` ignored
---* `"skybox"`: Uses 6 textures, `base_color` used as fog.
---* `"plain"`: Uses 0 textures, `base_color` used as both fog and sky.
---@type '"regular"'|'"skybox"'|'"plain"'
sky_parameters.type = nil

---A table containing up to six textures in the following order:
---
---Y+ (top), Y- (bottom), X- (west), X+ (east), Z+ (north), Z- (south)
---@type string[]
sky_parameters.textures = nil

---Whether clouds appear. (default: `true`)
---@type boolean
sky_parameters.clouds = nil

---A table used in `"regular"` type only, containing sky color values (alpha is ignored):
---@type sky_color
sky_parameters.sky_color = {}

---@class sky_color
local sky_color = {}

---For the top half of the sky during the day. (default: `#61b5f5`)
---@type ColorSpec
sky_color.day_sky = nil

---For the bottom half of the sky during the day. (default: `#90d3f6`)
---@type ColorSpec
sky_color.day_horizon = nil

---For the top half of the sky during dawn/sunset. (default: `#b4bafa`)
---
---The resulting sky color will be a dark version of the ColorSpec.
---
---**Warning:** The darkening of the ColorSpec is subject to change.
---@type ColorSpec
sky_color.dawn_sky = nil

---For the bottom half of the sky during dawn/sunset. (default: `#bac1f0`)
---
---The resulting sky color will be a dark version of the ColorSpec.
---
---**Warning:** The darkening of the ColorSpec is subject to change.
---@type ColorSpec
sky_color.dawn_horizon = nil

---For the top half of the sky during the night. (default: `#006bff`)
---
---The resulting sky color will be a dark version of the ColorSpec.
---
---**Warning:** The darkening of the ColorSpec is subject to change.
---@type ColorSpec
sky_color.night_sky = nil

---For the bottom half of the sky during the night. (default: `#4090ff`)
---
---The resulting sky color will be a dark version of the ColorSpec.
---
---**Warning:** The darkening of the ColorSpec is subject to change.
---@type ColorSpec
sky_color.night_horizon = nil

---For when you're either indoors or underground. (default: `#646464`)
---@type ColorSpec
sky_color.indoors = nil

---Changes the fog tinting for the sun at sunrise and sunset. (default: `#f47d1d`)
---@type ColorSpec
sky_color.fog_sun_tint = nil

---Changes the fog tinting for the moon at sunrise and sunset. (default: `#7f99cc`)
---@type ColorSpec
sky_color.fog_moon_tint = nil

---Changes which mode the directional fog abides by, `"custom"` uses `sun_tint` and `moon_tint`, while `"default"` uses the classic Minetest sun and moon tinting.
---
---Will use tonemaps, if set to `"default"`. (default: `"default"`)
---@type '"default"'|'"custom"'
sky_color.fog_tint_type = nil

---**Player Only**
---
---Change sky settings.
---
---Passing no arguments resets the sky to its default values.
---@param sky_parameters? sky_parameters
function ObjectRef:set_sky(sky_parameters) end

---**Player Only**
---
---Returns sky settings.
---@param as_table? boolean Determines whether the deprecated version of this function is being used. (see lua_api.txt for more infos)
---@return sky_parameters
function ObjectRef:get_sky(as_table) end

---**Player Only**
---
---Returns a table with the `sky_color` parameters as in `set_sky`.
---
---**DEPRECATED:** Use `get_sky(as_table)` instead.
---@deprecated
---@return sky_color
function ObjectRef:get_sky_color() end

---@class sun_parameters
local sun_parameters = {}

---Whether the sun is visible. (default: `true`)
---@type boolean
sun_parameters.visible = nil

---A regular texture for the sun.
---
---Setting to `""` will re-enable the mesh sun.
---
---Default: `"sun.png"`, if it exists.
---@type string
sun_parameters.texture = nil

---A 512x1 texture containing the tonemap for the sun (default: `"sun_tonemap.png"`)
---@type string
sun_parameters.tonemap = nil

---A regular texture for the sunrise texture. (default: `"sunrisebg.png"`)
---@type string
sun_parameters.sunrise = nil

---Whether the sunrise texture is visible. (default: `true`)
---@type boolean
sun_parameters.sunrise_visible = nil

---Float controlling the overall size of the sun. (default: `1`)
---@type number
sun_parameters.scale = nil

---**Player Only**
---
---Change sun settings.
---
---Passing no arguments resets the sun to its default values.
---@param parameters? sun_parameters
function ObjectRef:set_sun(parameters) end

---**Player Only**
---
---Returns the current sun settings.
---@return sun_parameters
function ObjectRef:get_sun() end

---@class moon_parameters
local moon_parameters = {}

---Whether the moon is visible. (default: `true`)
---@type boolean
moon_parameters.visible = nil

---A regular texture for the moon.
---
---Setting to `""` will re-enable the mesh moon.
---
---Default: `"moon.png"`, if it exists.
---
---Note: Relative to the sun, the moon texture is rotated by 180°. You can use the `^[transformR180` texture modifier to achieve the same orientation.
---@type string
moon_parameters.texture = nil

---A 512x1 texture containing the tonemap for the moon (default: `"sun_tonemap.png"`)
---@type string
moon_parameters.tonemap = nil

---Float controlling the overall size of the moon. (default: `1`)
---@type number
moon_parameters.scale = nil

---**Player Only**
---
---Change moon settings.
---
---Passing no arguments resets the moon to its default values.
---@param parameters? moon_parameters
function ObjectRef:set_moon(parameters) end

---**Player Only**
---
---Returns the current moon settings.
---@return moon_parameters
function ObjectRef:get_moon() end

---@class star_parameters
local star_parameters = {}

---Whether the stars are visible. (default: `true`)
---@type boolean
star_parameters.visible = nil

---The number of stars in the skybox.
---
---Only applies to `"skybox"` and `"regular"` sky types. (default: `1000`)
---@type integer
star_parameters.count = nil

---The color of the stars, alpha channel is used to set overall star brightness. (default: `#ebebff69`)
---@type ColorSpec
star_parameters.star_color = nil

---Float controlling the overall size of the stars. (default: `1`)
---@type number
star_parameters.scale = nil

---**Player Only**
---
---Change star settings.
---
---Passing no arguments resets stars to their default values.
---@param parameters? star_parameters
function ObjectRef:set_stars(parameters) end

---**Player Only**
---
---Returns the current star settings.
---@return star_parameters
function ObjectRef:get_stars() end

---@class cloud_parameters
local cloud_parameters = {}

---Cloud density.
---
---From `0` (no clouds) to `1` (full clouds) (default `0.4`)
---@type number
cloud_parameters.density = nil

---Cloud color with alpha channel (default `#fff0f0e5`).
---@type ColorSpec
cloud_parameters.color = nil

---Cloud color lower bound, use for a "glow at night" effect (alpha ignored, default `#000000`).
---@type ColorSpec
cloud_parameters.ambient = nil

---Cloud height (default per conf, usually `120`).
---@type integer
cloud_parameters.height = nil

---Cloud thickness in nodes (default `16`).
---@type integer
cloud_parameters.thickness = nil

---2D cloud speed + direction in nodes per second (default `{x=0, z=-2}`).
---@type {x: number, y: number}
cloud_parameters.speed = nil

---**Player Only**
---
---Change cloud settings.
---
---Passing no arguments resets clouds to their default values.
---@param parameters cloud_parameters
function ObjectRef:set_clouds(parameters) end

---**Player Only**
---
---Returns the current cloud settings.
---@return cloud_parameters
function ObjectRef:get_clouds() end

---**Player Only**
---
---Overrides day-night ratio, controlling sunlight to a specific amount.
---
---If `ratio` is `nil` the override is disabled.
---@param ratio? number Between `0` and `1`
function ObjectRef:override_day_night_ratio(ratio) end

---**Player Only**
---
---Returns the current day-night ratio or `nil` if no override is active.
---@return number?
function ObjectRef:get_day_night_ratio() end

---**Player Only**
---
---Set local (client side) animations of player model.
---
---Every animation equals to a `{x=starting frame, y=ending frame}` table.
---@param idle {x: integer, y: integer}
---@param walk {x: integer, y: integer}
---@param dig {x: integer, y: integer}
---@param walk_while_dig {x: integer, y: integer}
---@param frame_speed integer Sets the animations frame speed. Default is 30.
function ObjectRef:set_local_animation(idle, walk, dig, walk_while_dig, frame_speed) end

---**Player Only**
---
---Returns local (client side) animations of player model.
---@return {x: integer, y: integer} idle
---@return {x: integer, y: integer} walk
---@return {x: integer, y: integer} dig
---@return {x: integer, y: integer} walk_while_dig
---@return integer frame_speed
function ObjectRef:get_local_animation() end

---**Player Only**
---
---Defines offset vectors for camera per player.
---
---An argument defaults to `{x=0, y=0, z=0}` if unspecified.
---@param firstperson? Vector
---@param thirdperson? Vector
function ObjectRef:set_eye_offset(firstperson, thirdperson) end

---**Player Only**
---
---Returns first and third person offsets.
---@return Vector firstperson
---@return Vector thirdperson
function ObjectRef:get_eye_offset() end

---**Player Only**
---
---Sends a server-side loaded mapblock to the player.
---
---Returns `false` if failed.
---
---**Resource intensive - use sparsely.**
---
---To get blockpos, integer divide pos by 16.
---@param blockpos Vector
---@return boolean
function ObjectRef:send_mapblock(blockpos) end

---@class light_definition
local light_definition = {}

---Controls ambient shadows.
---* `intensity` sets the intensity of the shadows from 0 (no shadows, default) to 1 (blackness)
---@type {intensity: number}
light_definition.shadows = nil

---**Player Only**
---
---Sets lighting for the player.
---@param definition light_definition
function ObjectRef:set_lighting(definition) end

---**Player Only**
---
---Returns the current lighting of the player.
---@return light_definition
function ObjectRef:get_lighting() end
