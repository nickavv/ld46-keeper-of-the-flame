/// @description Ceiling Test
var colliderAbove = collision_rectangle(bbox_left, bbox_top + vspeed - 1, 
										bbox_right, bbox_top - 1, obj_collision, false, true);

if (colliderAbove != noone && vspeed < 0) {
	vspeed = 0;
	y = colliderAbove.bbox_bottom + (y - bbox_top) + 1;
	jumpFrame = 0;
}