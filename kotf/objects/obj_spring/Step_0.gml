if (instance_place(x, y, obj_keeper)) {
	if (sprite_index == restSprite) {
		change_sprite(activeSprite);
		obj_keeper.grounded = false;
		obj_keeper.vspeed = -springPower;
		obj_keeper.state = keeperState.falling;
	}
}