draw_self();

if (keepLevel <= 8) {
	draw_sprite(coolingOff ? spr_keep_meter_cooling : spr_keep_meter, keepLevel, x, bbox_top - 12);
}