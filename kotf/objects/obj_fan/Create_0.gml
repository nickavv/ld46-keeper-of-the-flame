fanSpeed = 0;
targetSpeed = 0;

initialized = false;
mDir = dir.down;
if (image_angle == 270) {
	mDir = dir.left;
} else if (image_angle == 90) {
	mDir = dir.right;
} else if (image_angle == 180) {
	mDir = dir.up;
}

particles = noone;
switch (mDir) {
	case dir.down:
		particles = instance_create_layer(x + 8, y + 12, layer, obj_particle_prespawn); break;
	case dir.up:
		particles = instance_create_layer(x + 8, y - 12, layer, obj_particle_prespawn); break;
	case dir.left:
		particles = instance_create_layer(x - 12, y + 8, layer, obj_particle_prespawn); break;
	case dir.right:
		particles = instance_create_layer(x + 12, y - 8, layer, obj_particle_prespawn); break;
}

var parentDir = mDir;
with (particles) {
	mDir = parentDir;
	instance_change(obj_particle_wind, true);
}