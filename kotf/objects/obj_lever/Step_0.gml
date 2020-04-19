if (sprite_index == spr_lever_off) {
	if (instance_place(x, y, obj_keeper)) {
		obj_keeper.state = keeperState.throwingLever;
		obj_keeper.x = lerp(obj_keeper.x, x, 0.8);
		change_sprite(spr_lever_throwing);
	}
}