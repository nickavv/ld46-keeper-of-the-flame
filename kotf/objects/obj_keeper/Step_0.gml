if (keyboard_check(vk_left)) {
	facing = dir.left;
} else if (keyboard_check(vk_right)) {
	facing = dir.right;
}

if (keyboard_check_pressed(ord("A"))) {
	jumpBufferedFrame = 5;
}
if (jumpBufferedFrame > 0) {
	jumpBufferedFrame --;
}

if (grounded && instance_place(x, y, obj_brazier)) {
	state = keeperState.lighting;
}

switch (state) {
	case keeperState.idle: {
		if (keyboard_check(vk_left) || keyboard_check(vk_right)) {
			state = keeperState.running;
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
	} break;
	case keeperState.lighting: {
		if (!brazierLit) {
			change_sprite(spr_keeper_lighting);
		}
		if (floor(image_index) == 4) {
			obj_brazier.lit = true;
		}
		x = lerp(x, obj_brazier.x - 7, 0.5);
		hspeed = 0;
		vspeed = 0;
	} break;
}