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

if (levelEnding) {
	levelEndingFrame ++;
	if (levelEndingFrame >= levelEndingFrames) {
		fadeDirection = fadeDir.out;
	}
	if (fadeFrame >= fadeFrames && nextLevel != noone) {
		room_goto(nextLevel);
	}
}

if (failed) {
	failedFrame ++;
	if (failedFrame >= failedFrames) {
		fadeDirection = fadeDir.out;
	}
	if (fadeFrame >= fadeFrames) {
		room_restart();
	}
}