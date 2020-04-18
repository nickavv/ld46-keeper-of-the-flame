image_alpha = fadeFrame / fadeFrames;

if (shown == false && distance_to_object(obj_keeper) < 60) {
	fadeDirection = fadeDir.in;
	shown = true;
}

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

if (shown && complete) {
	fadeDirection = fadeDir.out;
}

// Inherit event and set complete to true when tutorial is done