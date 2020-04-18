/// @description Wall test
var colliderLeft = collision_rectangle(bbox_left + hspeed - 1, bbox_top, 
									   bbox_left - 1, bbox_bottom - 1, obj_collision, false, true);
var colliderRight = collision_rectangle(bbox_right + 1, bbox_top, 
									   bbox_right + hspeed + 1, bbox_bottom - 1, obj_collision, false, true);

if (colliderLeft != noone && bbox_left > colliderLeft.bbox_right) {
	x = colliderLeft.bbox_right - (bbox_left - x) + 1;
	hspeed = 1;
}
if (colliderRight != noone && bbox_right < colliderRight.bbox_left) {
	x = colliderRight.bbox_left + (x - bbox_right) - 1;
	hspeed = -1;
}