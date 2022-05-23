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

--FIXME: toolcaps table
---Simulate a punch of the object.
---@param puncher ObjectRef
---@param time_from_last_punch number
---@param tool_capabilities table
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

---Object Properties
---@class object_properties
---@field hp_max integer
---@field breath_max integer
---@field zoom_fov number
---@field eye_height number
---@field physical boolean
---@field collide_with_objects boolean
---@field collisionbox number[6]
---@field selectionbox number[6]
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
---Returns a `PlayerMetaRef`
---@return PlayerMetaRef
function ObjectRef:get_meta() end






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

---@class hud_definition
---@field hud_elem_type '"image"'|'"text"'|'"statbar"'|'"inventory"'|'"compass"'|'"minimap"'
---@field position {x: number, y: number}
---@field name string
---@field scale {x: number, y: number}
---@field text string
---@field text2 string
---@field number number
---@field item integer
---@field direction 0|1|2|3
---@field alignment {x: number, y: number}
---@field offset {x: number, y: number}
---@field size {x: number, y: number}
---@field z_index integer
---@field style integer

---**Player Only**
---
---Add a HUD element to the player, returns ID on success
---@param hud_definition hud_definition
---@return integer?
function ObjectRef:hud_add(hud_definition) end

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