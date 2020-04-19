if (levelEnding) {
	draw_set_alpha(levelEndingFrame/min(levelEndingFrames, 20));
	draw_sprite_stretched(spr_msg_gradient, 0, 0, 100, 256, 48);
	draw_sprite(spr_msg_win, 0, 128, 122);
	draw_set_color(col_light_blue);
	var lineLength = 256 * (levelEndingFrame/min(levelEndingFrames, 15));
	var topLineY = 122 - (sprite_get_height(spr_msg_win) / 2) - 12;
	var bottomLineY = 122 + (sprite_get_height(spr_msg_win) / 2) + 12;
	draw_line_width(0, topLineY,lineLength, topLineY, 4);
	draw_line_width(256 - lineLength, bottomLineY, 256, bottomLineY, 4);
	draw_set_alpha(1);
} else if (failed) {
	draw_set_alpha(failedFrame/min(failedFrames, 20));
	draw_sprite_stretched(spr_msg_gradient_tall, 0, 0, 100, 256, 48);
	draw_sprite(spr_msg_lose, 0, 128, 122);
	draw_set_color(col_light_red);
	var lineLength = 256 * (failedFrame/min(failedFrames, 15));
	var topLineY = 122 - (sprite_get_height(spr_msg_lose) / 2) - 12;
	var bottomLineY = 122 + (sprite_get_height(spr_msg_lose) / 2) + 12;
	draw_line_width(0, topLineY,lineLength, topLineY, 4);
	draw_line_width(256 - lineLength, bottomLineY, 256, bottomLineY, 4);
	draw_set_alpha(1);
} 

if (drawLevelName) {
	draw_sprite_stretched(spr_gradient_bottom, 0, 0, 208, 256, 16);
	draw_set_font(font_level);
	draw_set_halign(fa_center);
	draw_set_color(col_dark);
	draw_text(128, 214, levelName);
	draw_set_color(col_light_blue);
	draw_text(128, 213, levelName);
}

// Finally draw a black fader if we're fading in or out
draw_set_alpha(fadeFrame/fadeFrames);
draw_set_color(c_black);
draw_rectangle(0, 0, guiWidth, guiHeight, false);
draw_set_alpha(1);