/// @description Set up for fail screen
layer_set_visible(layer_get_id("Tiles"), false);
layer_set_visible(layer_get_id("Instances"), false);
layer_background_blend(layer_background_get_id(layer_get_id("Background")), col_dark_red);
with (obj_fan) {
	instance_destroy();
}
with (obj_tutorial) {
	instance_destroy();
}
audio_stop_all();
play_sfx(snd_bell, 0);
play_sfx(snd_whoosh, 0);
drawLevelName = false;