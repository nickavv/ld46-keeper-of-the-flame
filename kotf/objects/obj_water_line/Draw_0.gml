if (!surface_exists(surface)) {
	surface = surface_create(room_width, room_height);
}
surface_set_target(surface);
	draw_clear_alpha(col_water_darken, 0.7);
surface_reset_target();
draw_surface(surface, 0, height + 3);

for (var i = 0; i < room_width; i += sprite_width) {
	draw_sprite(spr_water_line, image_index, i, height);
}