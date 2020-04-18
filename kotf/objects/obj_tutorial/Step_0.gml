image_alpha = fadeFrame / fadeFrames;

switch (fadeDirection) {
	case fadeDir.in:
		fadeFrame++;
		if (fadeFrame >= fadeFrames) {
			fadeDirection = fadeDir.none;
		}
		break;
	case fadeDir.out:
		if (!ending) {
			fadeFrame--;
			if (fadeFrame <= 0) {
				fadeDirection = fadeDir.none;
				ending = true;
				alarm[0] = 20;
			}
		}
		break;
}

if (complete) {
	fadeDirection = fadeDir.out;
}

// Inherit event and set complete to true when tutorial is done