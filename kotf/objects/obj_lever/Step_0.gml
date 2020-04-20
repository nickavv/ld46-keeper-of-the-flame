if (sprite_index == spr_lever_off) {
	if (instance_place(x, y, obj_keeper) && keyboard_check(ord("X"))) {
		obj_keeper.state = keeperState.throwingLever;
		obj_keeper.x = lerp(obj_keeper.x, x, 0.8);
		change_sprite(spr_lever_throwing);
		play_sfx(snd_lever, 0);
	}
}
if (sprite_index == spr_lever_on) {
	if (instance_place(x, y, obj_keeper) && keyboard_check(ord("X"))) {
		obj_keeper.state = keeperState.throwingLeverReverse;
		obj_keeper.x = lerp(obj_keeper.x, x, 0.8);
		change_sprite(spr_lever_throwing_reverse);
		play_sfx(snd_lever, 0);
	}
}