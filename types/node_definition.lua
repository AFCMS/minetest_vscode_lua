---@meta

---*_optional` drawtypes need less rendering time if deactivated (always client-side).
---@alias node_drawtype
---|> '"normal"' # A node-sized cube.
---| '"airlike"' # Invisible, uses no texture.
---| '"liquid"' # The cubic source node for a liquid. Faces bordering to the same node are never rendered. Connects to node specified in `liquid_alternative_flowing`. Use `backface_culling = false` for the tiles you want to make visible when inside the node.
---| '"flowingliquid"' # The flowing version of a liquid, appears with various heights and slopes.
---| '"glasslike"' # Often used for partially-transparent nodes. Only external sides of textures are visible.
---| '"glasslike_framed"' # All face-connected nodes are drawn as one volume within a surrounding frame. The frame appearance is generated from the edges of the first texture specified in `tiles`.
---| '"glasslike_framed_optional"' # This switches between the above 2 drawtypes according to the menu setting 'Connected Glass'.
---| '"allfaces"' # Often used for partially-transparent nodes. External and internal sides of textures are visible.
---| '"allfaces_optional"' # Often used for leaves nodes. This switches between `normal`, `glasslike` and `allfaces` according to the menu setting: Opaque Leaves / Simple Leaves / Fancy Leaves.
---| '"torchlike"' # A single vertical texture.
---| '"signlike"' # A single texture parallel to, and mounted against, the top, underside or side of a node.
---| '"plantlike"' # Two vertical and diagonal textures at right-angles to each other.
---| '"firelike"' # When above a flat surface, appears as 6 textures, the central 2 as `plantlike` plus 4 more surrounding those. If not above a surface the central 2 do not appear, but the texture appears against the faces of surrounding nodes if they are present.
---| '"fencelike"' # A 3D model suitable for a wooden fence. One placed node appears as a single vertical post. Adjacently-placed nodes cause horizontal bars to appear between them.
---| '"raillike"' # Often used for tracks for mining carts. Requires 4 textures to be specified in `tiles`, in order: straight, curved, t-junction, crossing.
---| '"nodebox"' # Often used for stairs and slabs. Allows defining nodes consisting of an arbitrary number of boxes. See **Nodebox**
---| '"mesh"' # Uses models for nodes. Tiles should hold model materials textures. Only static meshes are implemented.
---| '"plantlike_rooted"' # Enables underwater `plantlike` without air bubbles around the nodes. Consists of a base cube at the co-ordinates of the node plus a `plantlike` extension above

--FIXME: tiles

---@alias tile_animation_definition {type: "vertical_frames", aspect_w: integer, aspect_h: integer, length: number}|{type: "sheet_2d", frames_w: integer, frames_h: integer, frame_length: number}

---@alias tile_definition string|{name: string, animation: tile_animation_definition}|{name: string, backface_culling: boolean, align_style: '"node"'|'"world"'|'"user"', scale: integer}|{name: string, color: ColorSpec}

---@alias paramtype
---|'"light"' # The value stores light with and without sun in its lower and upper 4 bits respectively. Required by a light source node to enable spreading its light.
---|'"node"' # `param1` will not be used by the engine and can be used to store an arbitrary value

---@alias paramtype2
---|'"flowingliquid"'
---|'"wallmounted"'
---|'"facedir"'
---|'"leveled"'
---|'"degrotate"'
---|'"meshoptions"'
---|'"color"'
---|'"colorfacedir"'
---|'"colorwallmounted"'
---|'"glasslikeliquidlevel"'
---|'"colordegrotate"'
---|'"none"'

---@alias liquidtype
---|'"none"'
---|'"source"'
---|'"flowing"'

---@class nodebox
local nodebox = {}

---* `"regular"`: A normal cube; the default in most things
---* `"fixed"`: A fixed box (or boxes) (facedir param2 is used, if applicable)
---* `"leveled"`: A variable height box (or boxes) with the top face position defined by the node parameter `leveled = `, or if `paramtype2 == "leveled"` by param2. Other faces are defined by `fixed = {}` as with `type = "fixed"`.
---* `"wallmounted"`: A box like the selection box for torches (wallmounted param2 is used, if applicable)
---* `"connected"`: A node that has optional boxes depending on neighbouring nodes' presence and type. See also `node_definition.connects_to`.
---@type '"regular"'|'"fixed"'|'"leveled"'|'"wallmounted"'|'"connected"'
nodebox.type = nil

---**`"fixed"`, `"leveled"`, `"connected"` types only**
---@type number[]|number[][]
nodebox.fixed = nil

---**`"wallmounted"` type only**
---@type number[]
nodebox.wall_top = nil

---**`"wallmounted"` type only**
---@type number[]
nodebox.wall_bottom = nil

---**`"wallmounted"` type only**
---@type number[]
nodebox.wall_side = nil

---**`"connected"` type only**
---@type number[]|number[][]
nodebox.connect_top = nil

---**`"connected"` type only**
---@type number[]|number[][]
nodebox.connect_bottom = nil

---**`"connected"` type only**
---@type number[]|number[][]
nodebox.connect_front = nil

---**`"connected"` type only**
---@type number[]|number[][]
nodebox.connect_left = nil

---**`"connected"` type only**
---@type number[]|number[][]
nodebox.connect_back = nil

---**`"connected"` type only**
---@type number[]|number[][]
nodebox.connect_right = nil

---**`"connected"` type only**
---@type number[]|number[][]
nodebox.disconnected_top = nil

---**`"connected"` type only**
---@type number[]|number[][]
nodebox.disconnected_bottom = nil

---**`"connected"` type only**
---@type number[]|number[][]
nodebox.disconnected_front = nil

---**`"connected"` type only**
---@type number[]|number[][]
nodebox.disconnected_left = nil

---**`"connected"` type only**
---@type number[]|number[][]
nodebox.disconnected_back = nil

---**`"connected"` type only**
---@type number[]|number[][]
nodebox.disconnected_right = nil

---**`"connected"` type only**
---
---When there is *no* neighbour node.
---@type number[]|number[][]
nodebox.disconnected = nil

---**`"connected"` type only**
---
---When there are *no* neighbour nodes to the sides.
---@type number[]|number[][]
nodebox.disconnected_sides = nil


---@class drop_definition_item
local drop_definition_item = {}

---Specify the chance of dropping the items.
---
---`rarity = 1000` => `1` chance over `1000`
---
---Default: `1`
---@type integer
drop_definition_item.rarity = nil

---The items to drop.
---@type string[]
drop_definition_item.items = nil

---Only drop if using an item with one of these names.
---
---e.g. `{"default:shovel_mese", "default:shovel_diamond"}`
---@type string[]
drop_definition_item.tools = nil

---Whether all items in the dropped item list inherit the hardware coloring palette color from the dug node.
---
---Default: `false`
---@type boolean
drop_definition_item.inherit_color = nil

---Only drop if using an item with one the specified groups.
---
---e.g. Only drop if using an item in the `magicwand` group, or an item that is in both the `pickaxe` and the `lucky` groups.
---```lua
---tool_groups = {
---    "magicwand",
---    {"pickaxe", "lucky"}
---}
---```
---@type table
drop_definition_item.tool_groups = nil


---@class drop_definition
local drop_definition = {}

---Maximum number of item lists to drop.
---
---The entries in `items` are processed in order. For each:
---* Item filtering is applied, chance of drop is applied, if both are successful the entire item list is dropped.
---* Entry processing continues until the number of dropped item lists equals `max_items`.
---
---Therefore, entries should progress from low to high drop chance.
---
---Default: `0`
---@type integer
drop_definition.max_items = nil

---@type drop_definition_item[]
drop_definition.items = nil

---@class node_definition: item_definition
local node_definition = {}

---Node rendering type.
---@type node_drawtype
node_definition.drawtype = nil

---Supported for drawtypes "plantlike", "signlike", "torchlike", "firelike", "mesh", "nodebox", "allfaces".
---
---For plantlike and firelike, the image will start at the bottom of the node.
---
---For torchlike, the image will start at the surface to which the node "attaches".
---
---For the other drawtypes the image will be centered on the node.
---@type number
node_definition.visual_scale = nil

---Textures of node; +Y, -Y, +X, -X, +Z, -Z.
---
---Old field name was `tile_images`.
---
---List can be shortened to needed length.
---@type tile_definition[]
node_definition.tiles = nil

---Same as `tiles`, but these textures are drawn on top of the base tiles.
---
---You can use this to colorize only specific parts of your texture.
---
---If the texture name is an empty string, that overlay is not drawn.
---
---Since such tiles are drawn twice, it is not recommended to use overlays on very common nodes.
---@type tile_definition[]
node_definition.overlay_tiles = nil

---Special textures of node; used rarely.
---
---Old field name was `special_materials`.
---
---List can be shortened to needed length.
---@type tile_definition[]
node_definition.special_tiles = nil

---The node's original color will be multiplied with this color.
---
---If the node has a palette, then this setting only has an effect in the inventory and on the wield item.
---@type ColorSpec
node_definition.color = nil

---Specifies how the texture's alpha channel will be used for rendering.
---
---* `opaque`: Node is rendered opaque regardless of alpha channel
---* `clip`: A given pixel is either fully see-through or opaque depending on the alpha channel being below/above 50% in value
---* `blend`: The alpha channel specifies how transparent a given pixel of the rendered node is
---
---The default is `opaque` for drawtypes normal, liquid and flowingliquid; `clip` otherwise.
---
---If set to a boolean value (deprecated): true either sets it to blend or clip, false sets it to clip or opaque mode depending on the drawtype.
---@type '"opaque"'|'"clip"'|'"blend"'
node_definition.use_texture_alpha = nil

---The node's `param2` is used to select a pixel from the image.
---
---Pixels are arranged from left to right and from top to bottom.
---
---The node's color will be multiplied with the selected pixel's color.
---
---Tiles can override this behavior.
---
---Only when `paramtype2` supports palettes.
---@type string
node_definition.palette = nil

---Screen tint if player is inside node.
---@type ColorSpec
node_definition.post_effect_color = nil

---Define how to use the internal `param1` value.
---@type paramtype
node_definition.paramtype = nil

---Define how to use the internal `param2` value.
---@type paramtype2
node_definition.paramtype2 = nil

---Force value for param2 when player places node.
---@type integer
node_definition.place_param2 = nil

---If false, the cave generator and dungeon generator will not carve through this node.
---
---Specifically, this stops mod-added nodes being removed by caves and dungeons when those generate in a neighbor mapchunk and extend out beyond the edge of that mapchunk.
---@type boolean
node_definition.is_ground_content = nil

---If true, sunlight will go infinitely through this node.
---@type boolean
node_definition.sunlight_propagates = nil

---If true, objects collide with node
---@type boolean
node_definition.walkable = nil

---If true, can be pointed at
---@type boolean
node_definition.pointable = nil

---If false, can never be dug
---@type boolean
node_definition.diggable = nil

---If true, can be climbed on (ladder)
---@type boolean
node_definition.climbable = nil

---Slows down movement of players through this node (max. 7).
---
---If this is `nil`, it will be equal to liquid_viscosity.
---
---Note: If liquid movement physics apply to the node (see `liquid_move_physics`), the movement speed will also be affected by the `movement_liquid_*` settings.
---@type integer
node_definition.move_resistance = nil

---If true, placed nodes can replace this node.
---
---Default: `false`
---@type boolean
node_definition.buildable_to = nil

---If true, liquids can flow into and replace this node.
---
---Warning: making a liquid node `floodable` will cause problems.
---
---Default: `false`
---@type boolean
node_definition.floodable = nil

---Specifies flowing liquid physics.
---* `"none"`:    no liquid flowing physics
---* `"source"`:  spawns flowing liquid nodes at all 4 sides and below; recommended drawtype: `"liquid"`.
---* `"flowing"`: spawned from source, spawns more flowing liquid nodes around it until `liquid_range` is reached; will drain out without a source; recommended drawtype: `"flowingliquid"`.
---
---If it's `"source"` or `"flowing"` and `liquid_range > 0`, then both `liquid_alternative_*` fields must be specified
---@type liquidtype
node_definition.liquidtype = nil

---Flowing version of liquid source.
---
---See `node_definition.liquidtype`
---@type string
node_definition.liquid_alternative_flowing = nil

---Source version of liquid flowing.
---
---See `node_definition.liquidtype`
---@type string
node_definition.liquid_alternative_source = nil

---Controls speed at which the liquid spreads/flows (max. 7).
---
---`0` is fastest, `7` is slowest.
---
---By default, this also slows down movement of players inside the node (can be overridden using `node_definition.move_resistance`).
---@type integer
node_definition.liquid_viscosity = nil

---If true, a new liquid source can be created by placing two or more sources nearby.
---@type boolean
node_definition.liquid_renewable = nil

---Specifies movement physics if inside node:
---* `false`: No liquid movement physics apply.
---* `true`: Enables liquid movement physics. Enables things like ability to "swim" up/down, sinking slowly if not moving, smoother speed change when falling into, etc. The `movement_liquid_*` settings apply.
---* `nil`: Will be treated as `true` if `liquidype ~= "none"` and as `false` otherwise.
---
---Default: `nil`
---@type boolean
node_definition.liquid_move_physics = nil

---Only valid for `"nodebox"` drawtype with `type = "leveled"`.
---
---Allows defining the nodebox height without using param2.
---
---The nodebox height is `leveled / 64` nodes.
---
---The maximum value of `leveled` is `leveled_max`.
---@type integer
node_definition.leveled = nil

---Maximum value for `leveled` (`0-127`), enforced in `minetest.set_node_level` and `minetest.add_node_level`.
---
---Values above `124` might causes collision detection issues.
---@type integer
node_definition.leveled_max = nil

---Maximum distance that flowing liquid nodes can spread around source on flat land;
---
---Max: `8`; `0` to disable liquid flow.
node_definition.liquid_range = nil

---Player will take this amount of damage if no bubbles are left.
---@type integer
node_definition.drowning = nil

---If player is inside node, this damage is caused every second.
---@type integer
node_definition.damage_per_second = nil

---See `nodebox` definition.
---@type nodebox
node_definition.node_box = nil

---Used for nodebox nodes with `type = "connected"`.
---
---Specifies to what neighboring nodes connections will be drawn.
---
---e.g. `{"group:fence", "default:wood"}` or `"default:stone"`
---@type string|string[]
node_definition.connects_to = nil

---Tells connected nodebox nodes to connect only to these sides.
---
---e.g. `{ "top", "bottom", "front", "left", "back", "right" }`
---@type string[]
node_definition.connect_sides = nil

---File name of mesh when using `"mesh"` drawtype.
---@type string
node_definition.mesh = nil

---Custom selection box definition.
---
---Multiple boxes can be defined.
---
---If `"nodebox"` drawtype is used and `selection_box` is `nil`, then `nodebox` definition is used for the selection box by default.
---@type nodebox
node_definition.selection_box = nil

---Custom collision box definition.
---
---Multiple boxes can be defined.
---If `"nodebox"` drawtype is used and `collision_box` is `nil`, then `nodebox` definition is used for the collision box by default.
---@type nodebox
node_definition.collision_box = nil

---Support maps made in and before January 2012.
---@type boolean
node_definition.legacy_facedir_simple = nil

---Support maps made in and before January 2012.
---@type boolean
node_definition.legacy_wallmounted = nil

---Valid for drawtypes: `mesh`, `nodebox`, `plantlike`, `allfaces_optional`, `liquid`, `flowingliquid`.
---* `1`: Wave node like plants (node top moves side-to-side, bottom is fixed)
---* `2`: Wave node like leaves (whole node moves side-to-side)
---* `3`: Wave node like liquids (whole node moves up and down)
---
---Not all models will properly wave.
---* `plantlike` drawtype can only wave like plants
---* `allfaces_optional` drawtype can only wave like leaves
---* `liquid`, `flowingliquid` drawtypes can only wave like liquids
---@type 0|1|2|3
node_definition.waving = nil

---Definition of node sounds to be played at various events.
---
---All fields in this table are optional.
---
---* `footstep`: If walkable, played when object walks on it. If node is climbable or a liquid, played when object moves through it.
---* `dig`: Played while digging node. If `"__group"`, then the sound will be `default_dig_<groupname>`, where `<groupname>` is the name of the item's digging group with the fastest digging time. In case of a tie, one of the sounds will be played (but we cannot predict which one) Default value: `"__group"`.
---* `dug`: Played after node was dug.
---* `place`: Played after node was placed. Also played after falling
---* `place_failed`: Played when node placement failed. Note: this happens if the _built-in_ node placement failed. This sound will still be played if the node is placed in the `on_place` callback manually.
---* `fall`: Played when node starts to fall or is detached.
---@type {footstep: SimpleSoundSpec, dig: SimpleSoundSpec, dug: SimpleSoundSpec, place: SimpleSoundSpec, place_failed: SimpleSoundSpec, fall: SimpleSoundSpec}
node_definition.sounds = nil

---@type string|drop_definition
node_definition.drop = nil

---@type fun(pos: Vector)
node_definition.on_construct = nil

---@type fun(pos: Vector)
node_definition.on_destruct = nil

---@type fun(pos: Vector, oldnode: node)
node_definition.after_destruct = nil

---@type fun(pos: Vector, oldnode: node, newnode: node)
node_definition.on_flood = nil

---@type fun(pos: Vector, oldnode: node, oldmeta: NodeMetaRef, drops: ItemStack[])
node_definition.preserve_metadata = nil

---@type fun(pos: Vector, placer: ObjectRef, itemstack: ItemStack, pointed_thing: pointed_thing)
node_definition.after_place_node = nil

---@type fun(pos: Vector, oldnode: node, oldmetadata: NodeMetaRef, digger: ObjectRef)
node_definition.after_dig_node = nil

---@type fun(pos: Vector, player?: ObjectRef)
node_definition.can_dig = nil

---@type fun(pos: Vector, node: node, puncher: ObjectRef, pointed_thing: pointed_thing)
node_definition.on_punch = nil

---@type fun(pos: Vector, node: node, clicker: ObjectRef, itemstack: ItemStack, pointed_thing: pointed_thing)
node_definition.on_rightclick = nil

---@type fun(pos: Vector, node: node, digger: ObjectRef)
node_definition.on_dig = nil

---@type fun(pos: Vector, elapsed: number)
node_definition.on_timer = nil

---@type fun(pos: Vector, formname: string, fields: table<string, any>, sender: ObjectRef)
node_definition.on_receive_fields = nil

---@type fun(pos: Vector, from_list: string, from_index: integer, to_list: string, to_index: integer, count: integer, player: ObjectRef)
node_definition.allow_metadata_inventory_move = nil

---@type fun(pos: Vector, listname: string, index: integer, stack: ItemStack, player: ObjectRef)
node_definition.allow_metadata_inventory_put = nil

---@type fun(pos: Vector, listname: string, index: integer, stack: ItemStack, player: ObjectRef)
node_definition.allow_metadata_inventory_take = nil

---@type fun(pos: Vector, from_list: string, from_index: integer, to_list: string, to_index: integer, count: integer, player: ObjectRef)
node_definition.on_metadata_inventory_move = nil

---@type fun(pos: Vector, listname: string, index: integer, stack: ItemStack, player: ObjectRef)
node_definition.on_metadata_inventory_put = nil

---@type fun(pos: Vector, listname: string, index: integer, stack: ItemStack, player: ObjectRef)
node_definition.on_metadata_inventory_take = nil

---@type fun(pos: Vector, intensity: number)
node_definition.on_blast = nil

---**Automaticaly set by the engine**
---
---Contains the mod which registered the node.
---
---e.g.: if a node is registered as `:othermodname:nodename`, nodename will show `othermodname`, but `mod_origin` will say `modname`.
---@type string
node_definition.mod_origin = nil


--TODO: move this somewhere else

---comment
---@param name string
---@param def node_definition
function minetest.register_node(name, def) end

---@param name string
---@param def item_definition
function minetest.register_craftitem(name, def) end

---@param name string
---@param def item_definition
function minetest.register_tool(name, def) end

---@param name string
---@param redefinition node_definition
function minetest.override_item(name, redefinition) end

---@param name string
function minetest.unregister_item(name) end
