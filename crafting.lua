
local shell_mat, case_mat, dye_mat
local extra_mat = ""

if minetest.get_modpath("default") then
	shell_mat = "default:wood"
	case_mat = "default:steel_ingot"
	dye_mat = "default:mese_crystal_fragment"
end

if minetest.get_modpath("mcl_core") then
	shell_mat = "mcl_core:flint"
	case_mat = "mcl_core:iron_ingot"
end

if minetest.get_modpath("dye") then
	dye_mat = "dye:yellow"
end

if minetest.get_modpath("mcl_dye") then
	dye_mat = "mcl_dye:yellow"
end

if minetest.get_modpath("technic") then
	shell_mat = "technic:rubber"
end

if minetest.get_modpath("basic_materials") then
	case_mat = "basic_materials:plastic_sheet"
	extra_mat = "basic_materials:steel_strip"
end

if not shell_mat or not case_mat or not dye_mat then
	return
end

minetest.register_craft({
	output = "tape_measure:tape_measure",
	recipe = {
		{shell_mat, dye_mat, ""},
		{shell_mat, case_mat, extra_mat},
		{"", "", ""},
	}
})
