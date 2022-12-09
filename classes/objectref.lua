---@meta

---A reference to an entity.
---
---This is basically a reference to a C++ `ServerActiveObject`.
---@class ObjectRef: userdata
local ObjectRef = {}

-------------
-- Methods --
-------------

---Return position of the object
---@return Vector
---@nodiscard
function ObjectRef:get_pos() end

---Set position of the object
---@param pos Vector
function ObjectRef:set_pos(pos) end

---Returns the velocity of the object as a vector.
---@return Vector
---@nodiscard
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
---@param continuous? boolean
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
---@nodiscard
function ObjectRef:get_hp() end

--FIXME: reason table

---Set number of health points of the object.
---@param hp integer
---@param reason? table
function ObjectRef:set_hp(hp, reason) end

---Returns an `InvRef` for players, otherwise returns `nil`
---@return InvRef?
---@nodiscard
function ObjectRef:get_inventory() end

---Returns the inventory list the wielded item is in.
---@return string
---@nodiscard
function ObjectRef:get_wield_list() end

---Returns the index of the wielded item.
---@return integer
---@nodiscard
function ObjectRef:get_wield_index() end

---Returns the wielded `ItemStack`
---@return ItemStack
---@nodiscard
function ObjectRef:get_wielded_item() end

---Replaces the wielded item, returns `true` if successful.
---@param item ItemStack
---@return boolean
function ObjectRef:set_wielded_item(item) end

---Returns a table with the armor group ratings.
---@return { [string]: integer }
---@nodiscard
function ObjectRef:get_armor_groups() end

---Set armor group ratings.
---@param groups { [string]: integer }
function ObjectRef:set_armor_groups(groups) end

---Get object animation.
---@return {x: number, y: number} frame_range
---@return number frame_speed
---@return number frame_blend
---@return boolean frame_loop
---@nodiscard
function ObjectRef:get_animation() end

---Set object animation.
---@param frame_range {x: number, y: number}
---@param frame_speed? number Default: `15.0`
---@param frame_blend? number Default: `0.0`
---@param frame_loop? boolean Default: `true`
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
---@nodiscard
function ObjectRef:get_attach() end

---Returns a list of `ObjectRefs` that are attached to the object.
---@return ObjectRef[]
---@nodiscard
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
---@nodiscard
function ObjectRef:get_bone_position(bone) end

---Object Properties
---@class object_properties
---**Player Only**
---
---Defaults to `minetest.PLAYER_MAX_HP_DEFAULT`.
---@field hp_max integer
---**Player Only**
---
---Defaults to `minetest.PLAYER_MAX_BREATH_DEFAULT`.
---@field breath_max integer
---**Player Only**
---
---Zoom FOV in degrees.
---
---Note that zoom loads and/or generates world beyond the server's maximum send and generate distances, so acts like a telescope.
---
---Smaller zoom_fov values increase the distance loaded/generated.
---
---Defaults to 15 in creative mode, 0 in survival mode.
---
---`zoom_fov = 0` disables zooming for the player.
---@field zoom_fov number
---**Player Only**
---
---Camera height above feet position in nodes.
---
---Defaults to 1.625
---@field eye_height number
---Collide with `walkable` nodes.
---@field physical boolean
---Collide with other objects if `physical = true`
---@field collide_with_objects boolean
---`{xmin, ymin, zmin, xmax, ymax, zmax}` in nodes from object position.
---@field collisionbox number[]
---Selection box uses collision box dimensions when not set.
---
---`{xmin, ymin, zmin, xmax, ymax, zmax}` in nodes from object position.
---@field selectionbox number[]
---Overrides selection box when `false`.
---@field pointable boolean
---* `"cube"` is a node-sized cube.
---* `"sprite"` is a flat texture always facing the player.
---* `"upright_sprite"` is a vertical flat texture.
---* `"mesh"` uses the defined mesh model.
---* `"wielditem"` is used for dropped items. (see builtin/game/item_entity.lua).
---   * For this use 'wield_item = itemname' (Deprecated: 'textures = {itemname}').
---   * If the item has a 'wield_image' the object will be an extrusion of that, otherwise:
---      * If 'itemname' is a cubic node or nodebox the object will appear identical to 'itemname'.
---      * If 'itemname' is a plantlike node the object will be an extrusion of its texture.
---   * Otherwise for non-node items, the object will be an extrusion of 'inventory_image'.
---   * If 'itemname' contains a ColorString or palette index (e.g. from `minetest.itemstring_with_palette()`), the entity will inherit the color.
---* `"item"` is similar to `"wielditem"` but ignores the 'wield_image' parameter.
---@field visual '"cube"'|'"sprite"'|'"upright_sprite"'|'"mesh"'|'"wielditem"'|'"item"'
---Multipliers for the visual size.
---
---If `z` is not specified, `x` will be used to scale the entity along both horizontal axes.
---@field visual_size Vector|{x: number, y: number}
---File name of mesh when using `"mesh"` visual.
---@field mesh string
---Number of required textures depends on visual.
---* `"cube"` uses 6 textures just like a node, but all 6 must be defined.
---* `"sprite"` uses 1 texture.
---* `"upright_sprite"` uses 2 textures: {front, back}.
---* `"wielditem"` expects 'textures = {itemname}' (see 'visual' above).
---* `"mesh"` requires one texture for each mesh buffer/material (in order)
---@field textures string[]
---Number of required colors depends on visual.
---@field colors table
---Use texture's alpha channel.
---
---Excludes `"upright_sprite"` and `"wielditem"`.
---
---Note: currently causes visual issues when viewed through other semi-transparent materials such as water.
---@field use_texture_alpha boolean
---Used with spritesheet textures for animation and/or frame selection according to position relative to player.
---
---Defines the number of columns and rows in the spritesheet: `{x = columns, y = rows}`.
---@field spritediv {x: integer, y: integer}
---Used with spritesheet textures.
---
---Defines the `{x = column, y = row}` position of the initially used frame in the spritesheet.
---@field initial_sprite_basepos {x: integer, y: integer}
---If `false`, object is invisible and can't be pointed.
---@field is_visible boolean
---If `true`, is able to make footstep sounds of nodes (see node sound definition for details).
---@field makes_footstep_sound boolean
---Set constant rotation in radians per second, positive or negative.
---
---Object rotates along the local Y-axis, and works with set_rotation.
---
---Set to 0 to disable constant rotation.
---@field automatic_rotate number
---If positive number, object will climb upwards when it moves horizontally against a `walkable` node, if the height difference is within `stepheight`.
---@field stepheight number
---Automatically set yaw to movement direction, offset in degrees.
---
---`false` to disable.
---@field automatic_face_movement_dir number
---Limit automatic rotation to this value in degrees per second.
---
---No limit if value <= 0.
---@field automatic_face_movement_max_rotation_per_sec number
---Set to false to disable backface_culling for model.
---@field backface_culling boolean
---Add this much extra lighting when calculating texture color.
---
---Value < 0 disables light's effect on texture color.
---
---For faking self-lighting, UI style entities, or programmatic coloring in mods.
---@field glow integer
---The name to display on the head of the object. By default empty.
---
---If the object is a player, a nil or empty nametag is replaced by the player's name.
---
---For all other objects, a nil or empty string removes the nametag.
---
---To hide a nametag, set its color alpha to zero. That will disable it entirely.
---@field nametag string
---Text color of nametag.
---@field nametag_color ColorSpec
---Background color of nametag.
---
---`false` will cause the background to be set automatically based on user settings.
---
---Default: `false`
---@field nametag_bgcolor ColorSpec|false
---Same as infotext for nodes.
---
---Empty by default.
---@field infotext string
---If `false`, never save this object statically.
---
---It will simply be deleted when the block gets unloaded.
---
---The get_staticdata() callback is never called then.
---
---Defaults to `true`.
---@field static_save boolean
---Texture modifier to be applied for a short duration when object is hit.
---@field damage_texture_modifier string
---Setting this to `false` disables diffuse lighting of entity.
---@field shaded boolean
---Defaults to `true` for players, `false` for other entities.
---
---If set to `true` the entity will show as a marker on the minimap.
---@field show_on_minimap boolean

---Returns object properties.
---@return object_properties
---@nodiscard
function ObjectRef:get_properties() end

---Set objects properties.
---@param object_properties object_properties
function ObjectRef:set_properties(object_properties) end

---Returns `true` for players, `false` otherwise.
---@return boolean
---@nodiscard
function ObjectRef:is_player() end

---@class nametag_attributes
---@field text string
---@field color ColorSpec
---@field bgcolor ColorSpec|'"false"'

---Returns a table with the attributes of the nametag of an object.
---@return nametag_attributes
---@nodiscard
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
---@nodiscard
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
---@nodiscard
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
---@nodiscard
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
---@nodiscard
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
---@nodiscard
function ObjectRef:get_entity_name() end

---**Luaentity Only**
---
---Returns object luaentity.
---@return Luaentity
---@nodiscard
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
---@nodiscard
function ObjectRef:get_player_name() end

---**Player Only**
---
---**DEPRECATED**, use `get_velocity()` instead.
---@deprecated
---@return Vector
---@nodiscard
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
---@nodiscard
function ObjectRef:get_look_dir() end

---**Player Only**
---
---Returns player pitch in radians.
---
---Angle ranges between `-pi/2` and `pi/2`, which are straight up and down respectively.
---@return number
---@nodiscard
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
---@nodiscard
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
---@nodiscard
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
---@nodiscard
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
---@nodiscard
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
---@nodiscard
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
---@nodiscard
function ObjectRef:get_attribute(attribute) end

---**Player Only**
---
---Returns a `PlayerMetaRef`
---@return PlayerMetaRef
---@nodiscard
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
---@nodiscard
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
---@nodiscard
function ObjectRef:get_player_control_bits() end

---@class physics_override
---Multiplier to default walking speed value (default: `1`)
---@field speed number
---Multiplier to default jump value (default: `1`)
---@field jump number
---Multiplier to default gravity value (default: `1`)
---@field gravity number
---Whether player can sneak (default: `true`)
---@field sneak boolean
---Whether player can use the new move code replications of the old sneak side-effects: sneak ladders and 2 node sneak jump (default: `false`)
---@field sneak_glitch boolean
---Use new move/sneak code. When `false` the exact old code is used for the specific old sneak behaviour (default: `true`)
---@field new_move boolean

---**Player Only**
---
---Set physics overrides for player.
---@param override_table physics_override
function ObjectRef:set_physics_override(override_table) end

---**Player Only**
---
---Returns the table given to `set_physics_override`.
---@return physics_override
---@nodiscard
function ObjectRef:get_physics_override() end

--TODO: improve self documentation of hud definition using minetest modding book


---@class hud_definition
---Type of element.
---@field type '"image"'|'"text"'|'"statbar"'|'"inventory"'|'"waypoint"'|'"image_waypoint"'|'"compass"'|'"minimap"'
---Position of the element, starting from the top left corner of the screen.
---
---`{x=0.5, y=0.5}` would place the element at the center of the screen while `{x=0, y=0}` would keep it in the top left corner.
---@field position {x: number, y: number}
---Name of the element.
---@field name string
---@field scale {x: number, y: number}
---@field text string
---@field text2 string
---@field number number
---**TYPE: inventory**
---
---Selected item in inventory. 0 for no item selected.
---@field item integer
---Direction: `0`: left-right, `1`: right-left, `2`: top-bottom, `3`: bottom-top
---@field direction 0|1|2|3
---@field alignment {x: number, y: number}
---@field offset {x: number, y: number}
---@field size {x: number, y: number}
---Lower z-index HUDs are displayed behind higher z-index HUDs.
---
---* `-400`: Graphical effects, such as vignette
---* `-300`: Name tags, waypoints
---* `-200`: Wieldhand
---* `-100`: Things that block the player's view, e.g. masks
---* `0`: Default. For standard in-game HUD elements like crosshair, hotbar, minimap, builtin statbars, etc
---* `100`: Temporary text messages or notification icons
---* `1000`: Full-screen effects such as full-black screen or credits. This includes effects that cover the entire screen
---* `Other`: If your HUD element doesn't fit into any category, pick a number between the suggested values
---@field z_index integer
---Defint font style for "text" elements: bitfield with `1` = bold, `2` = italic, `4` = monospace
---@field style integer


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
---@param stat '"position"'|'"name"'|'"scale"'|'"text"'|'"text2"'|'"number"'|'"item"'|'"direction"'|'"alignment"'|'"offset"'|'"world_pos"'|'"size"'|'"z_index"'|'"style"'
---@param value any
function ObjectRef:hud_change(id, stat, value) end

---**Player Only**
---
---Returns the HUD element definition structure of the specified ID
---@param id integer
---@return hud_definition?
---@nodiscard
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
---@nodiscard
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
---@nodiscard
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
---@nodiscard
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
---@nodiscard
function ObjectRef:hud_get_hotbar_selected_image() end

--FIXME: unclear lua_api doc

---**Player Only**
---
---Overrides the available minimap modes, toggle order and changes the selected mode.
---@param modes table
---@param selected_mode integer
function ObjectRef:set_minimap_modes(modes, selected_mode) end

---@class sky_parameters
---Fog color in "skybox" and "plain" modes.
---@field base_color ColorSpec
--- Available types:
---* `"regular"`: Uses 0 textures, `base_color` ignored
---* `"skybox"`: Uses 6 textures, `base_color` used as fog.
---* `"plain"`: Uses 0 textures, `base_color` used as both fog and sky.
---@field type '"regular"'|'"skybox"'|'"plain"'
---A table containing up to six textures in the following order:
---
---Y+ (top), Y- (bottom), X- (west), X+ (east), Z+ (north), Z- (south)
---@field textures string[]
---Whether clouds appear. (default: `true`)
---@field clouds boolean
---A table used in `"regular"` type only, containing sky color values (alpha is ignored):
---@field sky_color sky_color

---@class sky_color
---For the top half of the sky during the day. (default: `#61b5f5`)
---@field day_sky ColorSpec
---For the bottom half of the sky during the day. (default: `#90d3f6`)
---@field day_horizon ColorSpec
---For the top half of the sky during dawn/sunset. (default: `#b4bafa`)
---
---The resulting sky color will be a dark version of the ColorSpec.
---
---**Warning:** The darkening of the ColorSpec is subject to change.
---@field dawn_sky ColorSpec
---For the bottom half of the sky during dawn/sunset. (default: `#bac1f0`)
---
---The resulting sky color will be a dark version of the ColorSpec.
---
---**Warning:** The darkening of the ColorSpec is subject to change.
---@field dawn_horizon ColorSpec
---For the top half of the sky during the night. (default: `#006bff`)
---
---The resulting sky color will be a dark version of the ColorSpec.
---
---**Warning:** The darkening of the ColorSpec is subject to change.
---@field night_sky ColorSpec
---For the bottom half of the sky during the night. (default: `#4090ff`)
---
---The resulting sky color will be a dark version of the ColorSpec.
---
---**Warning:** The darkening of the ColorSpec is subject to change.
---@field night_horizon ColorSpec
---For when you're either indoors or underground. (default: `#646464`)
---@field indoors ColorSpec
---Changes the fog tinting for the sun at sunrise and sunset. (default: `#f47d1d`)
---@field fog_sun_tint ColorSpec
---Changes the fog tinting for the moon at sunrise and sunset. (default: `#7f99cc`)
---@field fog_moon_tint ColorSpec
---Changes which mode the directional fog abides by, `"custom"` uses `sun_tint` and `moon_tint`, while `"default"` uses the classic Minetest sun and moon tinting.
---
---Will use tonemaps, if set to `"default"`. (default: `"default"`)
---@field fog_tint_type '"default"'|'"custom"'

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
---@nodiscard
function ObjectRef:get_sky(as_table) end

---**Player Only**
---
---Returns a table with the `sky_color` parameters as in `set_sky`.
---
---**DEPRECATED:** Use `get_sky(as_table)` instead.
---@deprecated
---@return sky_color
---@nodiscard
function ObjectRef:get_sky_color() end

---@class sun_parameters
---Whether the sun is visible. (default: `true`)
---@field visible boolean
---A regular texture for the sun.
---
---Setting to `""` will re-enable the mesh sun.
---
---Default: `"sun.png"`, if it exists.
---@field texture string
---A 512x1 texture containing the tonemap for the sun (default: `"sun_tonemap.png"`)
---@field tonemap string
---A regular texture for the sunrise texture. (default: `"sunrisebg.png"`)
---@field sunrise string
---Whether the sunrise texture is visible. (default: `true`)
---@field sunrise_visible boolean
---Float controlling the overall size of the sun. (default: `1`)
---@field scale number

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
---@nodiscard
function ObjectRef:get_sun() end

---@class moon_parameters
---Whether the moon is visible. (default: `true`)
---@field visible boolean
---A regular texture for the moon.
---
---Setting to `""` will re-enable the mesh moon.
---
---Default: `"moon.png"`, if it exists.
---
---Note: Relative to the sun, the moon texture is rotated by 180°. You can use the `^[transformR180` texture modifier to achieve the same orientation.
---@field texture string
---A 512x1 texture containing the tonemap for the moon (default: `"sun_tonemap.png"`)
---@field tonemap string
---Float controlling the overall size of the moon. (default: `1`)
---@field scale number

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
---@nodiscard
function ObjectRef:get_moon() end

---@class star_parameters
---Whether the stars are visible. (default: `true`)
---@field visible boolean
---The number of stars in the skybox.
---
---Only applies to `"skybox"` and `"regular"` sky types. (default: `1000`)
---@field count integer
---The color of the stars, alpha channel is used to set overall star brightness. (default: `#ebebff69`)
---@field star_color ColorSpec
---Float controlling the overall size of the stars. (default: `1`)
---@field scale number

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
---@nodiscard
function ObjectRef:get_stars() end

---@class cloud_parameters
---Cloud density.
---
---From `0` (no clouds) to `1` (full clouds) (default `0.4`)
---@field density number
---Cloud color with alpha channel (default `#fff0f0e5`).
---@field color ColorSpec
---Cloud color lower bound, use for a "glow at night" effect (alpha ignored, default `#000000`).
---@field ambient ColorSpec
---Cloud height (default per conf, usually `120`).
---@field height integer
---Cloud thickness in nodes (default `16`).
---@field thickness integer
---2D cloud speed + direction in nodes per second (default `{x=0, z=-2}`).
---@field speed {x: number, y: number}

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
---@nodiscard
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
---@nodiscard
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
---@nodiscard
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
---@nodiscard
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
---Controls ambient shadows.
---* `intensity` sets the intensity of the shadows from 0 (no shadows, default) to 1 (blackness)
---@field shadows {intensity: number}

---**Player Only**
---
---Sets lighting for the player.
---@param definition light_definition
function ObjectRef:set_lighting(definition) end

---**Player Only**
---
---Returns the current lighting of the player.
---@return light_definition
---@nodiscard
function ObjectRef:get_lighting() end
