facing = dir.right;
enum keeperState {
	idle,
	running,
	jumping,
	falling,
	lighting,
	failing,
	keeping,
	throwingLever,
	throwingLeverReverse
}
state = keeperState.idle;
brazierLit = false;

justFailed = true;

grounded = false;

jumpBufferedFrame = 0;
jumpFrame = 0;
jumpFrames = 5;
jumpPowerPerFrame = 1.35;

coyoteFrame = 0;

onFloatingPlatform = false;

runSpeed = 1.9;
airSpeed = 1.6;

keepLevel = 9;
keepFrame = 0;
keepFramesPerLevel = 40;
keepCooldown = false;
coolingOff = false;
keepCooldownFrames = 60;

failedWaitFrame = 0;
failedWaitFrames = 20;