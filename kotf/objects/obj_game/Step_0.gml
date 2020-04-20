if (instance_exists(obj_level)) {
	if (!obj_level.failed && !obj_level.levelEnding) {
		helpShown = keyboard_check(vk_escape);
	} else {
		helpShown = false;
	}
}