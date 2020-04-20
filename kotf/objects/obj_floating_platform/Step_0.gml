var lastY = y;
y = obj_water_line.height - 6 - (2 * dsin(current_time/15));
var speedDelta = y - lastY;

if (collision_rectangle(bbox_left, bbox_top - 64, bbox_right, bbox_top, obj_keeper, false, true)) {
	if (in_set(obj_keeper.state, [keeperState.idle, keeperState.running, keeperState.keeping])) {
		obj_keeper.vspeed += speedDelta;
		obj_keeper.onFloatingPlatform = true;
	} else {
		obj_keeper.onFloatingPlatform = false;
	}
} else {
	obj_keeper.onFloatingPlatform = false;
}