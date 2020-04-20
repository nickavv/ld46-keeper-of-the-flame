switch (fadeDirection) {
	case fadeDir.in:
		fadeFrame--;
		if (fadeFrame <= 0) {
			fadeDirection = fadeDir.none;
		}
		break;
	case fadeDir.out:
		fadeFrame++;
		if (fadeFrame >= fadeFrames) {
			fadeDirection = fadeDir.none;
		}
		break;
}

if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_down)) {
	selection = !selection;
}
if (keyboard_check(ord("A")) || keyboard_check(ord("S")) || keyboard_check(ord("X"))) {
	if (selection == 0) {
		startingGame = true;
	} else {
		game_end();
	}
}

if (startingGame) {
	fadeDirection = fadeDir.out;
	if (fadeFrame >= fadeFrames) {
		room_goto(level_1);
	}
}