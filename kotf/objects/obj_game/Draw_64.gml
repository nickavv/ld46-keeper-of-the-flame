if (!obj_level.failed && !obj_level.levelEnding && !helpShown) {
	draw_sprite(spr_help, 0, 0, 0);
}
if (helpShown) {
	draw_sprite(spr_controls, 0, 0, 0);
}