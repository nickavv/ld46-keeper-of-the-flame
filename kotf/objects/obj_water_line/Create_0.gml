targetHeight = y;
height = targetHeight;
surface = noone;
sound = audio_play_sound(snd_water, 1, true);
audio_sound_gain(sound, 0, 0);

targetSpeed = 0;
mSpeed = 0;
maxSpeed = 1.2;