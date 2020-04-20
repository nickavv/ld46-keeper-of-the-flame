if (room == win_screen) {
	instance_destroy();
} else {
	camera = camera_create_view(0, 0, width, height);
	var projectionMatrix = matrix_build_projection_ortho(width, height, 1, 2000);
	camera_set_proj_mat(camera, projectionMatrix);

	view_set_camera(0, camera);

	roomInitialized = false;
}