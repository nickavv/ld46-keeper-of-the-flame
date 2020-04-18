var canJump = in_set(state, [keeperState.idle, keeperState.running]);

if (canJump && jumpBufferedFrame > 0) {
	state = keeperState.jumping;
	jumpFrame = jumpFrames;
	grounded = false;
	y -= 2;
}