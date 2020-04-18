fanSpeed = offset ? 0 : 1;
targetSpeed = offset ? 0 : 1;

initialized = false;

particles = instance_create_layer(x + 8, y + 12, layer, obj_particle_wind);
if (!offset) {
	with (particles) {
		event_user(1);
	}
}