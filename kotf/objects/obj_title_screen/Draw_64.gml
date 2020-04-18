draw_sprite(spr_title, 0, 0, 0);

// Finally draw a black fader if we're fading in or out
draw_set_alpha(fadeFrame/fadeFrames);
draw_set_color(c_black);
draw_rectangle(0, 0, guiWidth, guiHeight, false);
draw_set_alpha(1);