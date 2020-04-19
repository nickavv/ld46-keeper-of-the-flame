/// @description play_sfx(sound, dist);
/// @param sound
/// @param distance
var sfx = argument0;
var distance = argument1;
var volume = 1 - (min(distance, 150)/150);

var sound = audio_play_sound(sfx, 1, false);
audio_sound_gain(sound, volume, 0);

return sound;