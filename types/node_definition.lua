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
---* `"regular"`: A normal cube; the default in most things
---* `"fixed"`: A fixed box (or boxes) (facedir param2 is used, if applicable)
---* `"leveled"`: A variable height box (or boxes) with the top face position defined by the node parameter `leveled = `, or if `paramtype2 == "leveled"` by param2. Other faces are defined by `fixed = {}` as with `type = "fixed"`.
---* `"wallmounted"`: A box like the selection box for torches (wallmounted param2 is used, if applicable)
---* `"connected"`: A node that has optional boxes depending on neighbouring nodes' presence and type. See also `node_definition.connects_to`.
---@field type '"regular"'|'"fixed"'|'"leveled"'|'"wallmounted"'|'"connected"'
---**`"fixed"`, `"leveled"`, `"connected"` types only**
---@field fixed number[]|number[][]
---**`"wallmounted"` type only**
---@field wall_top number[]
---**`"wallmounted"` type only**
---@field wall_bottom number[]
---**`"wallmounted"` type only**
---@field wall_side number[]
---**`"connected"` type only**
---@field connect_top number[]|number[][]
---**`"connected"` type only**
---@field connect_bottom number[]|number[][]
---**`"connected"` type only**
---@field connect_front number[]|number[][]
---**`"connected"` type only**
---@field connect_left number[]|number[][]
---**`"connected"` type only**
---@field connect_back number[]|number[][]
---**`"connected"` type only**
---@field connect_right number[]|number[][]
---**`"connected"` type only**
---@field disconnected_top number[]|number[][]
---**`"connected"` type only**
---@field disconnected_bottom number[]|number[][]
---**`"connected"` type only**
---@field disconnected_front number[]|number[][]
---**`"connected"` type only**
---@field disconnected_left number[]|number[][]
---**`"connected"` type only**
---@field disconnected_back number[]|number[][]
---**`"connected"` type only**
---@field disconnected_right number[]|number[][]
---**`"connected"` type only**
---
---When there is *no* neighbour node.
---@field disconnected number[]|number[][]
---**`"connected"` type only**
---
---When there are *no* neighbour nodes to the sides.
---@field disconnected_sides number[]|number[][]


---@class drop_definition_item
---Specify the chance of dropping the items.
---
---`rarity = 1000` => `1` chance over `1000`
---
---Default: `1`
---@field rarity integer
---The items to drop.
---@field items string[]
---Only drop if using an item with one of these names.
---
---e.g. `{"default:shovel_mese", "default:shovel_diamond"}`
---@field tools string[]
---Whether all items in the dropped item list inherit the hardware coloring palette color from the dug node.
---
---Default: `false`
---@field inherit_color boolean
---Only drop if using an item with one the specified groups.
---
---e.g. Only drop if using an item in the `magicwand` group, or an item that is in both the `pickaxe` and the `lucky` groups.
---```lua
---tool_groups = {
---    "magicwand",
---    {"pickaxe", "lucky"}
---}
---```
---@field tool_groups (string|string[])[]


---@class drop_definition
---Maximum number of item lists to drop.
---
---The entries in `items` are processed in order. For each:
---* Item filtering is applied, chance of drop is applied, if both are successful the entire item list is dropped.
---* Entry processing continues until the number of dropped item lists equals `max_items`.
---
---Therefore, entries should progress from low to high drop chance.
---
---Default: `0`
---@field max_items integer
---@field items drop_definition_item[]


---@class node_definition: item_definition
---Node rendering type.
---@field drawtype node_drawtype
---Supported for drawtypes "plantlike", "signlike", "torchlike", "firelike", "mesh", "nodebox", "allfaces".
---
---For plantlike and firelike, the image will start at the bottom of the node.
---
---For torchlike, the image will start at the surface to which the node "attaches".
---
---For the other drawtypes the image will be centered on the node.
---@field visual_scale number
---Textures of node; `+Y`, `-Y`, `+X`, `-X`, `+Z`, `-Z`.
---
---Old field name was `tile_images`.
---
---List can be shortened to needed length.
---@field tiles tile_definition[]
---Same as `tiles`, but these textures are drawn on top of the base tiles.
---
---You can use this to colorize only specific parts of your texture.
---
---If the texture name is an empty string, that overlay is not drawn.
---
---Since such tiles are drawn twice, it is not recommended to use overlays on very common nodes.
---@field overlay_tiles tile_definition[]
---Special textures of node; used rarely.
---
---Old field name was `special_materials`.
---
---List can be shortened to needed length.
---@field special_tiles tile_definition[]
---The node's original color will be multiplied with this color.
---
---If the node has a palette, then this setting only has an effect in the inventory and on the wield item.
---@field color ColorSpec
---Specifies how the texture's alpha channel will be used for rendering.
---
---* `opaque`: Node is rendered opaque regardless of alpha channel
---* `clip`: A given pixel is either fully see-through or opaque depending on the alpha channel being below/above 50% in value
---* `blend`: The alpha channel specifies how transparent a given pixel of the rendered node is
---
---The default is `opaque` for drawtypes normal, liquid and flowingliquid; `clip` otherwise.
---
---If set to a boolean value (deprecated): true either sets it to blend or clip, false sets it to clip or opaque mode depending on the drawtype.
---@field use_texture_alpha '"opaque"'|'"clip"'|'"blend"'
---The node's `param2` is used to select a pixel from the image.
---
---Pixels are arranged from left to right and from top to bottom.
---
---The node's color will be multiplied with the selected pixel's color.
---
---Tiles can override this behavior.
---
---Only when `paramtype2` supports palettes.
---@field palette string
---Screen tint if player is inside node.
---@field post_effect_color ColorSpec
---Define how to use the internal `param1` value.
---@field paramtype paramtype
---Define how to use the internal `param2` value.
---@field paramtype2 paramtype2
---Force value for `param2` when player places node.
---@field place_param2 integer
---If `false`, the cave generator and dungeon generator will not carve through this node.
---
---Specifically, this stops mod-added nodes being removed by caves and dungeons when those generate in a neighbor mapchunk and extend out beyond the edge of that mapchunk.
---@field is_ground_content boolean
---If `true`, sunlight will go infinitely through this node.
---@field sunlight_propagates boolean
---If `true`, objects collide with node.
---@field walkable boolean
---If `true`, can be pointed at.
---@field pointable boolean
---If `false`, can never be dug.
---@field diggable boolean
---If `true`, can be climbed on (ladder)
---@field climbable boolean
---Slows down movement of players through this node (max. 7).
---
---If this is `nil`, it will be equal to liquid_viscosity.
---
---Note: If liquid movement physics apply to the node (see `liquid_move_physics`), the movement speed will also be affected by the `movement_liquid_*` settings.
---@field move_resistance integer
---If `true`, placed nodes can replace this node.
---
---Default: `false`
---@field buildable_to boolean
---If `true`, liquids can flow into and replace this node.
---
---**Warning:** making a liquid node `floodable` will cause problems.
---
---Default: `false`
---@field floodable boolean
---Specifies flowing liquid physics.
---* `"none"`:    no liquid flowing physics
---* `"source"`:  spawns flowing liquid nodes at all 4 sides and below; recommended drawtype: `"liquid"`.
---* `"flowing"`: spawned from source, spawns more flowing liquid nodes around it until `liquid_range` is reached; will drain out without a source; recommended drawtype: `"flowingliquid"`.
---
---If it's `"source"` or `"flowing"` and `liquid_range > 0`, then both `liquid_alternative_*` fields must be specified.
---@field liquidtype liquidtype
---Flowing version of liquid source.
---
---See `node_definition.liquidtype`
---@field liquid_alternative_flowing string
---Source version of liquid flowing.
---
---See `node_definition.liquidtype`
---@field liquid_alternative_source string
---Controls speed at which the liquid spreads/flows (max. 7).
---
---`0` is fastest, `7` is slowest.
---
---By default, this also slows down movement of players inside the node (can be overridden using `node_definition.move_resistance`).
---@field liquid_viscosity integer
---If `true`, a new liquid source can be created by placing two or more sources nearby.
---@field liquid_renewable boolean
---Specifies movement physics if inside node:
---* `false`: No liquid movement physics apply.
---* `true`: Enables liquid movement physics. Enables things like ability to "swim" up/down, sinking slowly if not moving, smoother speed change when falling into, etc. The `movement_liquid_*` settings apply.
---* `nil`: Will be treated as `true` if `liquidype ~= "none"` and as `false` otherwise.
---
---Default: `nil`
---@field liquid_move_physics boolean?
---Only valid for `"nodebox"` drawtype with `type = "leveled"`.
---
---Allows defining the nodebox height without using param2.
---
---The nodebox height is `leveled / 64` nodes.
---
---The maximum value of `leveled` is `leveled_max`.
---@field leveled integer
---Maximum value for `leveled` (`0-127`), enforced in `minetest.set_node_level` and `minetest.add_node_level`.
---
---Values above `124` might causes collision detection issues.
---@field leveled_max integer
---Maximum distance that flowing liquid nodes can spread around source on flat land;
---
---Max: `8`; `0` to disable liquid flow.
---@field liquid_range integer
---Player will take this amount of damage if no bubbles are left.
---@field drowning integer
---If player is inside node, this damage is caused every second.
---@field damage_per_second integer
---See `nodebox` definition.
---@field node_box nodebox
---Used for nodebox nodes with `type = "connected"`.
---
---Specifies to what neighboring nodes connections will be drawn.
---
---e.g. `{"group:fence", "default:wood"}` or `"default:stone"`
---@field connects_to string|string[]
---Tells connected nodebox nodes to connect only to these sides.
---
---e.g. `{ "top", "bottom", "front", "left", "back", "right" }`
---@field connect_sides ('"top"'|'"bottom"'|'"front"'|'"left"'|'"back"'|'"right"')[]
---File name of mesh when using `"mesh"` drawtype.
---@field mesh string
---Custom selection box definition.
---
---Multiple boxes can be defined.
---
---If `"nodebox"` drawtype is used and `selection_box` is `nil`, then `nodebox` definition is used for the selection box by default.
---@field selection_box nodebox
---Custom collision box definition.
---
---Multiple boxes can be defined.
---If `"nodebox"` drawtype is used and `collision_box` is `nil`, then `nodebox` definition is used for the collision box by default.
---@field collision_box nodebox
---Support maps made in and before January 2012.
---@field legacy_facedir_simple boolean
---Support maps made in and before January 2012.
---@field legacy_wallmounted boolean
---Valid for drawtypes: `mesh`, `nodebox`, `plantlike`, `allfaces_optional`, `liquid`, `flowingliquid`.
---* `1`: Wave node like plants (node top moves side-to-side, bottom is fixed)
---* `2`: Wave node like leaves (whole node moves side-to-side)
---* `3`: Wave node like liquids (whole node moves up and down)
---
---Not all models will properly wave.
---* `plantlike` drawtype can only wave like plants
---* `allfaces_optional` drawtype can only wave like leaves
---* `liquid`, `flowingliquid` drawtypes can only wave like liquids
---@field waving 0|1|2|3
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
---@field sounds {footstep: SimpleSoundSpec, dig: SimpleSoundSpec, dug: SimpleSoundSpec, place: SimpleSoundSpec, place_failed: SimpleSoundSpec, fall: SimpleSoundSpec}
---@field drop string|drop_definition
---Node constructor; called after adding node.
---
---Can set up metadata and stuff like that.
---
---Not called for bulk node placement (i.e. schematics and VoxelManip).
---
---default: `nil`
---@field on_construct fun(pos: Vector)
---Node destructor; called before removing node.
---
---Not called for bulk node placement.
---
---default: `nil`
---@field on_destruct fun(pos: Vector)
---Node destructor; called after removing node.
---
---Not called for bulk node placement.
---
---default: `nil`
---@field after_destruct fun(pos: Vector, oldnode: node)
---Called when a liquid (newnode) is about to flood oldnode, if it has `floodable = true` in the nodedef.
---
---Not called for bulk node placement (i.e. schematics and VoxelManip) or air nodes.
---
---If return true the node is not flooded, but on_flood callback will most likely be called over and over again every liquid update interval.
---
---default: `nil`
---
---**Warning:** making a liquid node 'floodable' will cause problems.
---@field on_flood fun(pos: Vector, oldnode: node, newnode: node): boolean
---Called when oldnode is about be converted to an item, but before the node is deleted from the world or the drops are added.
---
---This is generally the result of either the node being dug or an attached node becoming detached.
---
---`oldmeta` is the `NodeMetaRef` of the oldnode before deletion.
---
---`drops` is a table of ItemStacks, so any metadata to be preserved can be added directly to one or more of the dropped items.
---
---See "ItemStackMetaRef".
---
---default: `nil`
---@field preserve_metadata fun(pos: Vector, oldnode: node, oldmeta: NodeMetaRef, drops: ItemStack[])
---Called after constructing node when node was placed using `minetest.item_place_node` / `minetest.place_node`.
---
---If return true no item is taken from itemstack.
---
---`placer` may be any valid ObjectRef or nil.
---
---default: `nil`
---@field after_place_node fun(pos: Vector, placer: ObjectRef, itemstack: ItemStack, pointed_thing: pointed_thing)
---Called after destructing node when node was dug using `minetest.node_dig` / `minetest.dig_node`.
---
---default: `nil`
---@field after_dig_node fun(pos: Vector, oldnode: node, oldmetadata: table, digger: ObjectRef)
---Returns `true` if node can be dug, or `false` if not.
---
---default: `nil`
---@field can_dig fun(pos: Vector, player?: ObjectRef): boolean
---Called when puncher (an `ObjectRef`) punches the node at `pos`.
---
---By default calls `minetest.register_on_punchnode` callbacks.
---
---default: `minetest.node_punch`
---@field on_punch fun(pos: Vector, node: node, puncher: ObjectRef, pointed_thing: pointed_thing)
---Called when clicker (an `ObjectRef`) used the 'place/build' key (not neccessarily an actual rightclick) while pointing at the node at pos with 'node' being the node table.
---
---`itemstack` will hold clicker's wielded item.
---
---Shall return the leftover itemstack.
---
---**Note:** pointed_thing can be nil, if a mod calls this function.
---
---This function does not get triggered by clients <=0.4.16 if the "formspec" node metadata field is set.
---
---default: nil
---@field on_rightclick fun(pos: Vector, node: node, clicker: ObjectRef, itemstack: ItemStack, pointed_thing?: pointed_thing): ItemStack
---By default checks privileges, wears out item (if tool) and removes node.
---
---Return true if the node was dug successfully, false otherwise.
---
---**Deprecated:** returning `nil` is the same as returning true.
---
---default: minetest.node_dig
---@field on_dig fun(pos: Vector, node: node, digger: ObjectRef): boolean
---Called by NodeTimers, see minetest.get_node_timer and NodeTimerRef.
---
---`elapsed` is the total time passed since the timer was started.
---
---Return `true` to run the timer for another cycle with the same timeout value.
---
---default: nil
---@field on_timer fun(pos: Vector, elapsed: number): boolean
---Called when an UI form (e.g. sign text input) returns data.
---
---See `minetest.register_on_player_receive_fields` for more info.
---
---`fields = {name1 = value1, name2 = value2, ...}`
---
---default: nil
---@field on_receive_fields fun(pos: Vector, formname: string, fields: table<string, any>, sender: ObjectRef)
---Called when a player wants to move items inside the inventory.
---
---Return value: number of items allowed to move.
---@field allow_metadata_inventory_move fun(pos: Vector, from_list: string, from_index: integer, to_list: string, to_index: integer, count: integer, player: ObjectRef): integer
---Called when a player wants to put something into the inventory.
---
---Return value: number of items allowed to put.
---
---Return value -1: Allow and don't modify item count in inventory.
---@field allow_metadata_inventory_put fun(pos: Vector, listname: string, index: integer, stack: ItemStack, player: ObjectRef): integer
---Called when a player wants to take something out of the inventory.
---
---Return value: number of items allowed to take.
---
---Return value -1: Allow and don't modify item count in inventory.
---@field allow_metadata_inventory_take fun(pos: Vector, listname: string, index: integer, stack: ItemStack, player: ObjectRef): integer
---@field on_metadata_inventory_move fun(pos: Vector, from_list: string, from_index: integer, to_list: string, to_index: integer, count: integer, player: ObjectRef)
---@field on_metadata_inventory_put fun(pos: Vector, listname: string, index: integer, stack: ItemStack, player: ObjectRef)
---@field on_metadata_inventory_take fun(pos: Vector, listname: string, index: integer, stack: ItemStack, player: ObjectRef)
---If defined, called when an explosion touches the node, instead of removing the node.
---
---`intensity: 1.0`: mid range of regular TNT.
---@field on_blast fun(pos: Vector, intensity: number)
---**Automaticaly set by the engine**
---
---Contains the mod which registered the node.
---
---e.g.: if a node is registered as `:othermodname:nodename`, nodename will show `othermodname`, but `mod_origin` will say `modname`.
---@field mod_origin string


minetest.register_node("ss", {
	test = "A",
	connect_sides = { "top", "bottom", "back" },
	waving = 0,
	on_blast = function(pos, intensity) end,
	drop = {
		items = {
			{ rarity = 1 },
		}
	},
})


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
