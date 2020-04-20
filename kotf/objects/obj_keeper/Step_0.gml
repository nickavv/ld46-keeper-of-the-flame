if (state != keeperState.failing) {
	if (keyboard_check(vk_left)) {
		facing = dir.left;
	} else if (keyboard_check(vk_right)) {
		facing = dir.right;
	}
}

if (keyboard_check_pressed(ord("A"))) {
	jumpBufferedFrame = 5;
}
if (jumpBufferedFrame > 0) {
	jumpBufferedFrame --;
}
if (coyoteFrame > 0) {
	coyoteFrame --;
}

if (grounded && instance_place(x, y, obj_brazier)) {
	state = keeperState.lighting;
}
switch (state) {
	case keeperState.idle: {
		if (keyboard_check(vk_left) || keyboard_check(vk_right)) {
			state = keeperState.running;
		}
		if (keyboard_check(ord("S")) && !coolingOff) {
			state = keeperState.keeping;
		}
		change_sprite(facing == dir.left ? spr_keeper_idle_left : spr_keeper_idle_right);
		hspeed = lerp(hspeed, 0, 0.18);
		vspeed = 0;
		event_user(1);
		event_user(3);
	} break;
	case keeperState.running: {
		if (keyboard_check_released(vk_left) || keyboard_check_released(vk_right)) {
			state = keeperState.idle;
		}
		if (keyboard_check(ord("S")) && !coolingOff) {
			state = keeperState.keeping;
		}
		change_sprite(facing == dir.left ? spr_keeper_run_left : spr_keeper_run_right);
		hspeed = lerp(hspeed, runSpeed * (facing == dir.left ? -1 : 1), 0.25);
		vspeed = 0;
		event_user(1);
		event_user(3);
	} break;
	case keeperState.jumping: {
		if (keyboard_check(ord("A")) && jumpFrame > 0) {
			vspeed -= jumpPowerPerFrame;
			jumpFrame --;
		} else {
			jumpFrame = 0;
		}
		if (vspeed >= 0) {
			state = keeperState.falling;
		}
		change_sprite(facing == dir.left ? spr_keeper_jump_left : spr_keeper_jump_right);
		if (keyboard_check(vk_left)) {
			hspeed = lerp(hspeed, -airSpeed, 0.2);
		} else if (keyboard_check(vk_right)) {
			hspeed = lerp(hspeed, airSpeed, 0.2);
		}
		vspeed += 0.35;
		event_user(0);
		event_user(1);
		event_user(2);
	} break;
	case keeperState.falling: {
		change_sprite(facing == dir.left ? spr_keeper_jump_left : spr_keeper_jump_right);
		if (keyboard_check(vk_left)) {
			hspeed = lerp(hspeed, -airSpeed, 0.2);
		} else if (keyboard_check(vk_right)) {
			hspeed = lerp(hspeed, airSpeed, 0.2);
		}
		if (grounded) {
			state = keeperState.idle;
		}
		vspeed += 0.35;
		event_user(0);
		event_user(1);
		event_user(2);
	} break;
	case keeperState.keeping: {
		change_sprite(facing == dir.left ? spr_keeper_keep_left : spr_keeper_keep_right);
		if (keyboard_check_released(ord("S"))) {
			state = keeperState.idle;
		}
		if (keepLevel == 9) {
			keepLevel = 8;
		}
		if (keepLevel == 0) {
			state = keeperState.idle;
		}
		hspeed = 0;
		vspeed = 0;
	} break;
	case keeperState.throwingLever: {
		change_sprite(spr_keeper_throwing_lever);
		hspeed = 0;
		vspeed = 0;
	} break;
	case keeperState.throwingLeverReverse: {
		change_sprite(spr_keeper_throwing_lever_reverse);
		hspeed = 0;
		vspeed = 0;
	} break;
	case keeperState.lighting: {
		if (!brazierLit) {
			change_sprite(spr_keeper_lighting);
			with (obj_music_player) {
				event_user(0);
			}
		}
		if (floor(image_index) == 4) {
			obj_brazier.lit = true;
		}
		x = lerp(x, obj_brazier.x - 7, 0.5);
		hspeed = 0;
		vspeed = 0;
	} break;
	case keeperState.failing: {
		hspeed = 0;
		vspeed = 0;
		if (justFailed) {
			with (obj_level) {
				event_user(0);
			}
			justFailed = false;
		}
		change_sprite(facing == dir.left ? spr_keeper_fail_left : spr_keeper_fail_right);
	} break;
}



if (onFloatingPlatform && grounded) {
	if (collision_rectangle(bbox_left, bbox_top + vspeed - 1, 
										bbox_right, bbox_top - 1, obj_trapdoor, false, true)) {
		obj_keeper.state = keeperState.failing;
	}
}

if (state == keeperState.keeping) {
	keepFrame = (keepFrame + 1) % keepFramesPerLevel;
	if (keepFrame == 0) {
		keepLevel = max(keepLevel - 1, 0);
		if (keepLevel == 0) {
			keepCooldown = true;
			coolingOff = true;
			alarm[0] = keepCooldownFrames;
		}
	}
} else if (keepLevel <= 8) {
	if (!keepCooldown) {
		keepFrame = (keepFrame + 1) % keepFramesPerLevel;
		if (keepFrame == 0) {
			keepLevel = min(keepLevel + 1, 9);
			if (keepLevel == 9) {
				coolingOff = false;
			}
		}
	}
}

if (state == keeperState.failing && image_speed == 0) {
	failedWaitFrame++;
	if (failedWaitFrame >= failedWaitFrames) {
		obj_level.failed = true;
	}
}