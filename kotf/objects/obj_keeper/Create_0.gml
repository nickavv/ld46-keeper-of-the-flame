facing = dir.right;
enum keeperState {
	idle,
	running,
	jumping,
	falling,
	lighting,
	failing,
	keeping
}
state = keeperState.idle;
brazierLit = false;

grounded = false;

jumpBufferedFrame = 0;
jumpFrame = 0;
jumpFrames = 5;
jumpPowerPerFrame = 1.35;

runSpeed = 1.9;
airSpeed = 1.6;

keepLevel = 9;
keepFrame = 0;
keepFramesPerLevel = 40;
keepCooldown = false;
coolingOff = false;
keepCooldownFrames = 60;