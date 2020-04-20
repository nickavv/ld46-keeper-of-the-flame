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

audio_master_gain(1 - (fadeFrame/fadeFrames));

if (levelEnding) {
	if (levelEndingFrame == 0) {
		play_sfx(snd_goodbell, 0);
		play_sfx(snd_swoosh, 0);
	}
	drawLevelName = false;
	levelEndingFrame ++;
	if (levelEndingFrame >= levelEndingFrames) {
		fadeDirection = fadeDir.out;
	}
	if (fadeFrame >= fadeFrames && nextLevel != noone) {
		room_goto(nextLevel);
	}
}

if (failed) {
	if (failedFrame == 0) {
		play_sfx(snd_swoosh, 0);
	}
	failedFrame ++;
	if (failedFrame >= failedFrames) {
		fadeDirection = fadeDir.out;
	}
	if (fadeFrame >= fadeFrames) {
		obj_game.failures += 1;
		room_restart();
	}
}

// DEBUG level skip, Alt+Shift+N
if (keyboard_check(vk_alt) && keyboard_check(vk_shift) && keyboard_check_pressed(ord("N"))) {
	room_goto(nextLevel);
}