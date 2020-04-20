/// @description Lower Water Level
// Putting this in an alarm so that it doesn't happen 
// the instant the switch is pulled, to give The Keeper
// a chance to hop off first
if (onValue != -1 && offValue != -1) {
	obj_water_line.targetHeight = offValue;
}