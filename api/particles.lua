---@meta

---@class particle_definition
---@field pos Vector
---@field velocity Vector
---@field acceleration Vector
---Disappears after expirationtime seconds
---@field expirationtime number
---Scales the visual size of the particle texture.
---
---If `node` is set, size can be set to 0 to spawn a randomly-sized particle (just like actual node dig particles).
---@field size number
---If `true` collides with `walkable` nodes and, depending on the `object_collision` field, objects too.
---@field collisiondetection boolean
---If `true` particle is removed when it collides.
---
---Requires `collisiondetection = true` to have any effect.
---@field collision_removal boolean
---If `true` particle collides with objects that are defined as `physical = true,` and `collide_with_objects = true,`.
---
---Requires `collisiondetection = true` to have any effect.
---@field object_collision boolean
---If `true` faces player using y axis only.
---@field vertical boolean
---The texture of the particle.
---@field texture string
---Optional, if specified spawns particle only on the player's client.
---@field playername string
---Optional, specifies how to animate the particle texture.
---@field animation tile_animation_definition
---Optional, specify particle self-luminescence in darkness.
---
---Values 0-14.
---@field glow integer
---Optional, if specified the particle will have the same appearance as node dig particles for the given node.
---
---`texture` and `animation` will be ignored if this is set.
---@field node node
---Optional, only valid in combination with `node`.
---
---If set to a valid number 1-6, specifies the tile from which the particle texture is picked.
---
---Otherwise, the default behavior is used. (currently: any random tile)
---@field node_tile integer

---Add a particle with given definition.
---
---The overloaded definition is deprecated.
---@overload fun(pos: Vector, velocity: Vector, acceleration: Vector, expirationtime: number, size: number, collisiondetection: boolean, texture: string, playername: string)
---@param def particle_definition
function minetest.add_particle(def) end

---@alias particlespawner_new_pos
---| number # All components of every particle's position vector will be set to this value
---| Vector # All particles will appear at this exact position throughout the lifetime of the particlespawner
---| particlespawner_new_pos_table

---@class particlespawner_new_pos_table
---`min` is the minimum value this property will be set to in particles spawned by the generator
---@field min Vector
---`max` is the maximum value this property will be set to in particles spawned by the generator
---@field max Vector
---When `bias` is 0, all random values are exactly as likely as any other.
---
---When it is positive, the higher it is, the more likely values will appear towards the minimum end of the allowed spectrum.
---
---When it is negative, the lower it is, the more likely values will appear towards the maximum end of the allowed spectrum.
---
---The curve is exponential and there is no particular maximum or minimum value.
---@field bias number

---@alias particlespawner_new_float
---| number
---| particlespawner_new_pos_float

---@class particlespawner_new_pos_float
---`min` is the minimum value this property will be set to in particles spawned by the generator
---@field min number
---`max` is the maximum value this property will be set to in particles spawned by the generator
---@field max number
---When `bias` is 0, all random values are exactly as likely as any other.
---
---When it is positive, the higher it is, the more likely values will appear towards the minimum end of the allowed spectrum.
---
---When it is negative, the lower it is, the more likely values will appear towards the maximum end of the allowed spectrum.
---
---The curve is exponential and there is no particular maximum or minimum value.
---@field bias number

---@alias particlespawner_new_tween_style
---|'"fwd"' # Linear animation from first to last frame (default)
---|'"rev"' # Linear animation from last to first frame
---|'"pulse"' # Linear animation from first to last then back to first again
---|'"flicker"' # Like `"pulse"`, but slightly randomized to add a bit of stutter

---@class particlespawner_definition
---Number of particles spawned over the time period `time`.
---@field amount integer
---Lifespan of spawner in seconds.
---
---If time is 0 spawner has infinite lifespan and spawns the `amount` on a per-second basis.
---@field time number
---If `true` collides with `walkable` nodes and, depending on the `object_collision` field, objects too.
---@field collisiondetection boolean
---If `true` particle is removed when it collides.
---
---Requires `collisiondetection = true` to have any effect.
---@field collision_removal boolean
---If `true` particle collides with objects that are defined as `physical = true,` and `collide_with_objects = true,`.
---
---Requires `collisiondetection = true` to have any effect.
---@field object_collision boolean
---If defined, particle positions, velocities and accelerations are relative to this object's position and yaw
---@field attached ObjectRef
---If `true` faces player using y axis only.
---@field vertical boolean
---The texture of the particle.
---@field texture string|particle_texture
---A `texpool` consists of a list of possible particle textures.
---
---Every time a particle is spawned, the engine will pick a texture at random from the `texpool` and assign it as that particle's texture.
---
---You can also specify a `texture` in addition to a `texpool`; the `texture` value will be ignored on newer clients but will be sent to older (pre-v5.6.0) clients that do not implement texpools.
---@field texpool (string|particle_texture)[]
---Optional, if specified spawns particle only on the player's client.
---@field playername string
---Optional, specifies how to animate the particle texture.
---@field animation tile_animation_definition
---Optional, specify particle self-luminescence in darkness.
---
---Values 0-14.
---@field glow integer
---Optional, if specified the particle will have the same appearance as node dig particles for the given node.
---
---`texture` and `animation` will be ignored if this is set.
---@field node node
---Optional, only valid in combination with `node`.
---
---If set to a valid number 1-6, specifies the tile from which the particle texture is picked.
---
---Otherwise, the default behavior is used. (currently: any random tile)
---@field node_tile integer
---@field minpos Vector
---@field maxpos Vector
---@field minvel Vector
---@field maxvel Vector
---@field minacc Vector
---@field maxacc Vector
---@field minexptime number
---@field maxexptime number
---@field minsize number
---@field maxsize number
---The position at which particles can appear
---@field pos particlespawner_new_pos
---@field pos_tween {style: particlespawner_new_tween_style, reps: integer, [integer]: particlespawner_new_pos}
---The initial velocity of the particle
---@field vel particlespawner_new_pos
---@field vel_tween {style: particlespawner_new_tween_style, reps: integer, [integer]: particlespawner_new_pos}
---The direction and speed with which the particle accelerates
---@field acc particlespawner_new_pos
---@field acc_tween {style: particlespawner_new_tween_style, reps: integer, [integer]: particlespawner_new_pos}
---Offsets the velocity of each particle by a random amount within the specified range each frame.
---
---Used to create Brownian motion.
---@field jitter particlespawner_new_pos
---@field jitter_tween {style: particlespawner_new_tween_style, reps: integer, [integer]: particlespawner_new_pos}
---The amount by which absolute particle velocity along each axis is decreased per second.
---
---A value of 1.0 means that the particle will be slowed to a stop over the space of a second; a value of -1.0 means that the particle speed will be doubled every second.
---
---To avoid interfering with gravity provided by `acc`, a drag vector like `vector.new(1,0,1)` can be used instead of a uniform value.
---@field drag particlespawner_new_pos
---@field drag_tween {style: particlespawner_new_tween_style, reps: integer, [integer]: particlespawner_new_pos}
---How bouncy the particles are when `collisiondetection` is turned on.
---
---Values less than or equal to `0` turn off particle bounce; `1` makes the particles bounce without losing any velocity, and `2` makes them double their velocity with every bounce. `bounce` is not bounded but values much larger than `1.0` probably aren't very useful.
---@field bounce particlespawner_new_float
---@field bounce_tween {style: particlespawner_new_tween_style, reps: integer, [integer]: particlespawner_new_float}
---The number of seconds after which the particle disappears.
---@field exptime particlespawner_new_float
---@field exptime_tween {style: particlespawner_new_tween_style, reps: integer, [integer]: particlespawner_new_float}
---Sets the birth orientation of particles relative to various shapes defined in world coordinate space.
---
---This is an alternative means of setting the velocity which allows particles to emerge from or enter into some entity or node on the map, rather than simply being assigned random velocity values within a range. the velocity calculated by this method will be **added** to that specified by `vel` if `vel` is also set, so in most cases **`vel` should be set to 0**.
---@field attract {kind: particlespawner_new_attract_kind, strength: particlespawner_new_attract_strength, strenght_tween: {style: particlespawner_new_tween_style, reps: integer, [integer]: particlespawner_new_attract_strength}}

---Selects the kind of shape towards which the particles will be oriented.
---@alias particlespawner_new_attract_kind
---No attractor is set and the `attractor` table is ignored.
---|>'"none"'
---The particles are attracted to a specific point in space.
---
---Use this also if you want a sphere-like effect, in combination with the `radius` property.
---|'"point"'
---The particles are attracted to an (infinite) line passing through the points `origin` and `angle`.
---
---Use this for e.g. beacon effects, energy beam effects, etc.
---|'"line"'
---The particles are attracted to an (infinite) plane on whose surface `origin` designates a point in world coordinate space.
---
---Use this for e.g. particles entering or emerging from a portal.
---|'"plane"'

---The speed with which particles will move towards `attractor`.
---
---If negative, the particles will instead move away from that point.
---@alias particlespawner_new_attract_strength number

---@alias particlespawner_new_texture_blend
---Blends transparent pixels with those they are drawn a top according to the alpha channel of the source texture.
---
---Useful for e.g. material objects like rocks, dirt, smoke, or node chunks.
---|>'"alpha"'
---Adds the value of pixels to those underneath them, modulo the sources alpha channel.
---
---Useful for e.g. bright light effects like sparks or fire.
---|'"add"'
---Like "add" but less bright. useful for subtler light effects.
---
---Note that this is NOT formally equivalent to the "screen" effect used in image editors and compositors, as it does not respect the alpha channel of of the image being blended.
---|'"screen"'
---The inverse of "add"; the value of the source pixel is subtracted from the pixel underneath it.
---
---A white pixel will turn whatever is underneath it black; a black pixel will be "transparent".
---
---Useful for creating darkening effects.
---|'"sub"'


---In versions before v5.6.0, particlespawner textures could only be specified as a single texture string.
---
---After v5.6.0, textures can now be specified as a table as well.
---
---This table contains options that allow simple animations to be applied to the texture.
---@class particle_texture
---@field name string The texture file name
---Controls how visible the particle is.
---* `1.0`: the particle is fully visible
---* `0`: the particle is completely invisible
---@field alpha number
---Can be used instead of `alpha` to animate the alpha value over the particle's lifetime.
---
---Time references are understood with respect to the particle's lifetime, not the spawner's.
---
---`{1,0}` fades the particle out over its lifetime.
---@field alpha_tween {style: particlespawner_new_tween_style, reps: integer, [integer]: number}
---Scales the texture onscreen.
---@field scale number|{x: number, y: number}
---Animates the scale over the particle's lifetime.
---@field scale_tween {style: particlespawner_new_tween_style, reps: integer, [integer]: number|{x: number, y: number}}
---@field blend particlespawner_new_texture_blend
---@field animation tile_animation_definition

---@param def particlespawner_definition
function minetest.add_particlespawner(def) end

minetest.add_particlespawner({
	pos_tween = {
		style = "fwd",
		reps = 1,
	},
	bounce = {},
	texture = {
		blend = "add",
		animation = {

		},
		scale_tween = {
			{ x = 1, y = 1 }
		}
	},
	texpool = {
		{ alpha = 1.2, blend = "alpha", name = "test.png" }
	},
	attract = {
		kind = "none",
		strength = 0.1
	},
})
