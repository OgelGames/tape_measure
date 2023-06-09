
local S = minetest.get_translator("tape_measure")

local function measure(stack, player, pointed)
	if not stack or not player or not pointed then
		return
	end
	if pointed.type ~= "node" or not pointed.under or not pointed.above then
		return
	end
	local pos = pointed.under
	if player:get_player_control().sneak then
		pos = pointed.above
	end
	local name = player:get_player_name()
	local meta = stack:get_meta()
	local start = meta:get("start_pos")
	local spos = minetest.pos_to_string(pos)
	if not start then
		meta:set_string("start_pos", spos)
		minetest.chat_send_player(name, S("Start position set to @1", spos))
		return stack
	end
	start = minetest.string_to_pos(start)
	minetest.chat_send_player(name, S("End position set to @1", spos))
	meta:set_string("start_pos", "")
	local dist = vector.distance(start, pos)
	dist = string.format("%s", math.floor(dist * 100) / 100).."m"
	local offset = vector.subtract(pos, start)
	local x, y, z = math.abs(offset.x), math.abs(offset.y), math.abs(offset.z)
	local size = string.format("%s x %s x %s", x+1, y+1, z+1)
	minetest.chat_send_player(name, S("Distance: @1 | Size: @2", dist, size))
	return stack
end

local player_waypoints = {}

minetest.register_on_leaveplayer(function(player)
	local name = player:get_player_name()
	player_waypoints[name] = nil
end)

local function waypoint(_, player, pointed)
	if not player or not pointed then
		return
	end
	local name = player:get_player_name()
	local new_pos
	if pointed.type == "node" and pointed.under and pointed.above then
		if player:get_player_control().sneak then
			new_pos = pointed.above
		else
			new_pos = pointed.under
		end
	end
	local id = player_waypoints[name]
	if id then
		if new_pos then
			player:hud_change(id, "world_pos", new_pos)
		else
			player:hud_remove(id)
			player_waypoints[name] = nil
		end
		return
	end
	if not new_pos then
		return
	end
	player_waypoints[name] = player:hud_add({
		hud_elem_type = "waypoint",
		name = S("Tape Measure Waypoint"),
		text = "m",
		number = 0xFFFFFF,
		world_pos = new_pos
	})
end

minetest.register_tool("tape_measure:tape_measure", {
	description = S("Tape Measure"),
	inventory_image = "tape_measure_inv.png",
	wield_image = "tape_measure_wield.png",
	groups = {tool = 1},
	on_use = measure,
	on_place = waypoint,
	on_secondary_use = waypoint,
})

dofile(minetest.get_modpath("tape_measure").."/crafting.lua")
