if (state != keeperState.jumping && jumpBufferedFrame > 0) {
	state = keeperState.jumping;
	jumpFrame = jumpFrames;
	grounded = false;
	y -= 2;
}