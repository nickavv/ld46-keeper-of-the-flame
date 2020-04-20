draw_sprite(spr_endcard, 0, 0, 0);

draw_set_font(font_level);
draw_set_halign(fa_center);
var failStr = "FAILURES: " + string(obj_game.failures);
draw_set_color(col_dark);
draw_text(128, 100, failStr);
draw_set_color(col_light_blue);
draw_text(128, 99, failStr);

draw_set_color(col_dark);
draw_text(128, 140, "Play Again");
draw_set_color(col_light_blue);
draw_text(128, 139, "Play Again");

draw_set_color(col_dark);
draw_text(128, 155, "Quit");
draw_set_color(col_light_blue);
draw_text(128, 154, "Quit");

draw_sprite(spr_pointer, 0, 80, 135 + (selection * 15));

// Finally draw a black fader if we're fading in or out
draw_set_alpha(fadeFrame/fadeFrames);
draw_set_color(c_black);
draw_rectangle(0, 0, guiWidth, guiHeight, false);
draw_set_alpha(1);