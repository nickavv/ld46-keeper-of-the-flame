if (instance_place(x, y, obj_keeper)) {
	if (sprite_index == spr_spring) {
		change_sprite(spr_spring_active);
		obj_keeper.grounded = false;
		obj_keeper.vspeed = -8;
		obj_keeper.state = keeperState.falling;
	}
}