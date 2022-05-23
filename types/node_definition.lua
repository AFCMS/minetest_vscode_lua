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
---The default is "opaque" for drawtypes normal, liquid and flowingliquid; `clip` otherwise.
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





--TODO: move this somewhere else

---comment
---@param name string
---@param def node_definition
function minetest.register_node(name, def) end

minetest.register_node("ddz", {
	visual_scale = 1.1,
	drawtype = "normal",
	tiles = {""},
	use_texture_alpha = "opaque",
	sunlight_propagates = false,
})