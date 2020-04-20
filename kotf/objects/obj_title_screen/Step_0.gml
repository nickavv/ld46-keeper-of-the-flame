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

if (!startingGame && keyboard_check(ord("A"))) {
	startingGame = true;
}

if (startingGame) {
	fadeDirection = fadeDir.out;
	if (fadeFrame >= fadeFrames) {
		room_goto(level_1);
	}
}