/// @description In-air ground test
var colliderBelow = collision_rectangle(bbox_left + 1, bbox_bottom + 1, 
										bbox_right - 1, bbox_bottom + vspeed + 1, 
										obj_collision, true, true);
if (colliderBelow != noone) {
	grounded = true;
	y = colliderBelow.bbox_top - (bbox_bottom - y) - 1;
	vspeed = 0;
}