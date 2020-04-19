if (timer != -1 && !initialized) {
	initialized = true;
	alarm[0] = offsetTime + 1;
}
fanSpeed = lerp(fanSpeed, targetSpeed, 0.04);
image_speed = fanSpeed;

if (targetSpeed == 1 && fanSpeed > 0.4) {
	var collision = false;
	switch (mDir) {
		case dir.down:
			collision = collision_rectangle(x - 8, y + 8, x + 8, y + 80, obj_keeper, false, true);
			break;
		case dir.up:
			collision = collision_rectangle(x - 8, y - 8, x + 8, y - 80, obj_keeper, false, true);
			break;
		case dir.left:
			collision = collision_rectangle(x - 8, y - 8, x - 80, y + 8, obj_keeper, false, true);
			break;
		case dir.right:
			collision = collision_rectangle(x + 8, y - 8, x + 80, y + 8, obj_keeper, false, true);
			break;
	}
	if (collision) {
		if (obj_keeper.state != keeperState.keeping) {
			obj_keeper.state = keeperState.failing;
		}
	}
}

if (!audio_is_playing(sound) && targetSpeed == 1) {
	sound = play_sfx(snd_wind, distance_to_object(obj_keeper));
}