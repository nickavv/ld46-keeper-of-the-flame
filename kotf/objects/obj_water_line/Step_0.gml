height = lerp(height, targetHeight, 
		(min(lever.onValue, lever.offValue)/max(lever.onValue, lever.offValue))* 0.02);

if (obj_keeper.bbox_top + 10 > height) {
	obj_keeper.state = keeperState.failing;
	play_sfx(snd_splash, 0);
}

if (targetHeight < height - 8) {
	with (obj_drain) {
		change_sprite(spr_drain_flowing);
	}
} else {
	with (obj_drain) {
		change_sprite(spr_drain);
	}
}

if (lever != noone) {
	targetHeight = lever.thrown ? lever.onValue : lever.offValue;
}

if (abs(targetHeight - height) > 15) {
	if (audio_sound_get_gain(sound) == 0) {
		audio_sound_gain(sound, 1, 300);
	}
} else {
	if (audio_sound_get_gain(sound) == 1) {
		audio_sound_gain(sound, 0, 300);
	}
}