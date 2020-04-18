targetSpeed = !targetSpeed;
var on = targetSpeed;
with (particles) {
	event_user(on);
}
alarm[0] = timer + (on ? 0 : pause);