if (timer != -1 && !initialized) {
	initialized = true;
	alarm[0] = offsetTime + 1;
}
fanSpeed = lerp(fanSpeed, targetSpeed, 0.04);
image_speed = fanSpeed;

if (targetSpeed == 1 && fanSpeed > 0.4) {
	if (collision_rectangle(x - 8, y + 8, x + 8, y + 80, obj_keeper, false, true)) {
		if (obj_keeper.state != keeperState.keeping) {
			obj_keeper.state = keeperState.failing;
		}
	}
}