//Generated for GMS2 in Geon FX v1.2.4
//Put this code in Create event

ps = part_system_create();
part_system_depth(ps, -1);

pt_wind = part_type_create();
part_type_shape(pt_wind, pt_shape_pixel);
part_type_size(pt_wind, 1, 1, 0, 0);
part_type_orientation(pt_wind, 0, 0, 0, 0, 0);
part_type_color3(pt_wind, c_white, c_white, c_white);
part_type_alpha3(pt_wind, 0, 0.60, 0.2);
part_type_blend(pt_wind, 0);
part_type_life(pt_wind, 20, 30);
part_type_speed(pt_wind, 0.1, 0.3, 0.15, 0.2);
part_type_gravity(pt_wind, 0, 0);

if (mDir == dir.down) {
	part_type_direction(pt_wind, 268, 272, 0, 2);
	part_type_scale(pt_wind, 0.7, 2.8);
} else if (mDir == dir.up) {
	part_type_direction(pt_wind, 88, 92, 0, 2);
	part_type_scale(pt_wind, 0.7, 2.8);
} else if (mDir == dir.right) {
	part_type_direction(pt_wind, -2, 2, 0, 2);
	part_type_scale(pt_wind, 2.8, 0.7);
} else if (mDir == dir.left) {
	part_type_direction(pt_wind, 178, 182, 0, 2);
	part_type_scale(pt_wind, 2.8, 0.7);
}

//NewEffect Emitters
pe_wind = part_emitter_create(ps);

var xp, yp;
xp = x;
yp = y;
if (mDir == dir.down || mDir == dir.up) {
	part_emitter_region(ps, pe_wind, xp-10, xp+10, yp+0, yp+0, ps_shape_rectangle, ps_distr_linear);
} else {
	part_emitter_region(ps, pe_wind, xp-0, xp+0, yp-10, yp+10, ps_shape_rectangle, ps_distr_linear);
}