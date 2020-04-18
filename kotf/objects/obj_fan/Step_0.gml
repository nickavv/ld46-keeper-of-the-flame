if (timer != -1 && !initialized) {
	initialized = true;
	alarm[0] = timer;
}
fanSpeed = lerp(fanSpeed, targetSpeed, 0.04);
image_speed = fanSpeed;

if (targetSpeed == 1) {
	if (collision_rectangle(x - 8, y + 8, x + 8, y + 80, obj_keeper, false, true)) {
		obj_keeper.state = keeperState.failing;
	}
}