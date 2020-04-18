facing = dir.right;
enum keeperState {
	idle,
	running,
	jumping,
	falling
}
state = keeperState.idle;

grounded = false;

jumpBufferedFrame = 0;
jumpFrame = 0;
jumpFrames = 6;
jumpPowerPerFrame = 1.2;

runSpeed = 1.9;
airSpeed = 0;
