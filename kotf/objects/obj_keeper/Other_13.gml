/// @description On ground grounded test
var colliderBelow = collision_rectangle(bbox_left + 1, bbox_bottom + 1, 
										bbox_right - 1, bbox_bottom + vspeed + 1, 
										obj_collision, true, true);
if (colliderBelow == noone) {
	grounded = false;
	state = keeperState.falling;
	coyoteFrame = 10;
}