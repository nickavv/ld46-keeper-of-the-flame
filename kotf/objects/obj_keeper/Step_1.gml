if (state != keeperState.jumping && jumpBufferedFrame > 0) {
	state = keeperState.jumping;
	airSpeed = abs(hspeed);
	jumpFrame = jumpFrames;
	grounded = false;
	y -= 2;
}