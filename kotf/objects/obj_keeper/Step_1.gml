var canJump = in_set(state, [keeperState.idle, keeperState.running]) || coyoteFrame > 0;

if (canJump && jumpBufferedFrame > 0) {
	state = keeperState.jumping;
	jumpFrame = jumpFrames;
	coyoteFrame = 0;
	grounded = false;
	y -= 2;
	play_sfx(snd_jump, 0);
}