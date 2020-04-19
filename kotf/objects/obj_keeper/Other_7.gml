/// @description 
if (sprite_index = spr_keeper_lighting) {
	change_sprite(spr_keeper_idle_right);
	brazierLit = true;
}
if (sprite_index == spr_keeper_fail_left || 
	sprite_index == spr_keeper_fail_right) {
	image_index = image_number - 1;
	image_speed = 0;
}